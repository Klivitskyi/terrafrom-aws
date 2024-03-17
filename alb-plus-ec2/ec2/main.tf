data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

resource "aws_instance" "web-1" {
    ami           = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    subnet_id = var.subnet-private-1.id
    security_groups = [var.web-sg.id]
    user_data     = filebase64("web.sh")
    associate_public_ip_address = false
    
}

resource "aws_instance" "web-2" {
    ami           = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    subnet_id = var.subnet-private-2.id
    security_groups = [var.web-sg.id]
    user_data     = filebase64("web.sh")
    associate_public_ip_address = false
}