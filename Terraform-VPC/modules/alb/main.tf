#ALB
resource "aws_lb" "alb" {
  name               = "application-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_id]
  subnets            = var.subnets

}

#Listener
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

#Target Group
resource "aws_lb_target_group" "tg" {
  name        = "tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id

  health_check {
    interval            = 60  
    path                = "/" 
    port                = "traffic-port" 
    protocol            = "HTTP" 
    timeout             = 5  
    unhealthy_threshold = 2   
    healthy_threshold   = 2   
  }
}

#Target Group Attachment
resource "aws_lb_target_group_attachment" "tga" {
  count = length(var.intstances)
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.intstances[count.index]
  port             = 80
}