resource "aws_lb" "tutorial" {

  name               = "tutorial-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.instance-sg]
  subnet_mapping {
    subnet_id = var.public_subnet_id-a
    
  }
   subnet_mapping {
    subnet_id = var.public_subnet_id-c
    
  }
 
  enable_deletion_protection = false


  tags = {
    Environment = "production"
  }
}

resource "aws_lb_target_group" "tutorial" {

  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.tutorial.arn
  port              = "80"
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tutorial.arn
  }
}