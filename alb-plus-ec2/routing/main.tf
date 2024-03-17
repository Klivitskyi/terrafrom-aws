resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc.id
}

resource "aws_route_table" "public-route-table" {
  vpc_id = var.vpc.id
}

resource "aws_route" "public-route" {
  route_table_id         = aws_route_table.public-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public-subnet-3-association" {
  subnet_id      = var.subnet-public-3.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "public-subnet-4-association" {
  subnet_id      = var.subnet-public-4.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_eip" "ip" {}

resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = aws_eip.ip.id
  subnet_id     = var.subnet-public-3.id
}

resource "aws_route_table" "nat-route" {
  vpc_id = var.vpc.id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gateway.id
  }
}

resource "aws_route_table_association" "private-subnet-1-association" {
  subnet_id      = var.subnet-private-1.id
  route_table_id = aws_route_table.nat-route.id
}

resource "aws_route_table_association" "private-subnet-2-association" {
  subnet_id      = var.subnet-private-2.id
  route_table_id = aws_route_table.nat-route.id
}
