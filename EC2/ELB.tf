#External-ELB 생성
resource "aws_lb" "terraform-external-elb" {
  name = "terraform-external-elb"
  subnets = ["${aws_subnet.terraform-public-1.id}", "${aws_subnet.terraform-public-2.id}"]
  security_groups = ["${aws_security_group.terraform-External-ELB-sg.id}"]
  load_balancer_type = "application"

  tags = {
    Name = "terraform-external-elb"
  }
}

#target group 생성
resource "aws_lb_target_group" "terraform-tg" {
  name = "terraform-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.terraform_vpc.id

  health_check {
    interval = 30
    path = "/"
    healthy_threshold = 3
    unhealthy_threshold = 3
  }
}

#타겟 그룹에 타겟 설정
resource "aws_lb_target_group_attachment" "terraform-tg-attach" {
  target_group_arn = aws_lb_target_group.terraform-tg.arn
  target_id = "${aws_instance.terraform-web-1.id}"
  port = 80
}

resource "aws_lb_target_group_attachment" "terraform-tg-attach2" {
  target_group_arn = aws_lb_target_group.terraform-tg.arn
  target_id = "${aws_instance.terraform-web-2.id}"
  port = 80
}

#alb 리스너 설정
resource "aws_alb_listener" "http" {
  load_balancer_arn = "${aws_lb.terraform-external-elb.arn}"
  port = "80"
  protocol = "HTTP"

  default_action {
    target_group_arn = "${aws_lb_target_group.terraform-tg.arn}"
    type = "forward"
  }
}