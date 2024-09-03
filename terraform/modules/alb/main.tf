resource "aws_lb" "alb" {
  name               = "try-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_id]
  subnets            =  var.subnet_id

  tags = {
    Name = "${var.project_name}-alb"
  }
}

# listener
resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP" 

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}

#target_group
resource "aws_lb_target_group" "alb_tg" {
  name     = "alb-instance-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

#target group attachment
resource "aws_lb_target_group_attachment" "alb_target_group" {
    count = length(var.ec2)
  target_group_arn = aws_lb_target_group.alb_tg.arn
  target_id        = var.ec2[count.index]
  port             = 80
}