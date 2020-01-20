resource "aws_lb" "alb" {
  name               = "${var.name_prefix}-alb"
  internal           = var.internal
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = var.subnet_ids
  tags               = var.tags
}

resource "aws_security_group" "alb_sg" {
  name_prefix = "${var.name_prefix}-alb_sb"
  vpc_id      = var.vpc_id
}
