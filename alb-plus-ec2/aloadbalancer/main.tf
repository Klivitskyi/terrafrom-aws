resource "aws_lb" "ALB" {
  name               = "ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb-sg.id]
  subnets            = [var.subnet-public-3.id, var.subnet-public-4.id]

  enable_deletion_protection = false

#   access_logs {
#     bucket  = aws_s3_bucket.lb_logs.id
#     prefix  = "ALB"
#     enabled = true
#   }
}

resource "aws_lb_target_group" "alb_tg" {
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc.id
}

resource "aws_lb_listener" "listener_front" {
  load_balancer_arn = aws_lb.ALB.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "attach_to_ec2_1" {
  target_group_arn = aws_lb_target_group.alb_tg.arn
  target_id        = var.ec2-1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "attach_to_ec2_2" {
  target_group_arn = aws_lb_target_group.alb_tg.arn
  target_id        = var.ec2-2.id
  port             = 80
}