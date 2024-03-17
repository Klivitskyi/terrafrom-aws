output "web-sg" {
  value = aws_security_group.web-sg
}

output "alb-sg" {
  value = aws_security_group.alb-sg
}