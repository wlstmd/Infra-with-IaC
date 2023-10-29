#bastion-sg 생성
resource "aws_security_group" "terraform-bastion-sg" {
  vpc_id = ${aws_vpc.terraform_vpc.id}"
  name = "terraform-bastion-sg"
  
  tags = {
    Name = "terraform-bastion-sg"
  }
}

# External-ELB-sg 생성
resource "aws_security_group" "terraform-External-ELB-sg" {
  vpc_id = "${aws_vpc.terraform_vpc.id}"
  name = "terraform-External-ELB-sg"

  tags = {
    Name = "terraform-External-ELB-sg"
  }
}

# web-sg 생성
resource "aws_security_group" "terraform-web-sg" {
  vpc_id = "${aws_vpc.terraform_vpc.id}"
  name = "terraform-web-sg"

  tags = {
    Name = "terraform-web-sg"
  }
}

# internal-ELB-sg 생성
resource "aws_security_group" "terraform-Internal-ELB-sg" {
  vpc_id = "${aws_vpc.terraform_vpc.id}"
  name = "terraform-Internal-ELB-sg"

  tags = {
    Name = "terraform-Internal-ELB-sg"
  }
}


# db-sg 생성
resource "aws_security_group" "terraform-db-sg" {
  vpc_id = "${aws_vpc.terraform_vpc.id}"
  name = "terraform-db.sg"

  tags = {
    Name = "terraform-db.sg"
  }
}


#terraform-Internal-ELB-sg 인바운드 규칙 추가
resource "aws_security_group_rule" "terraform-Internal-ELB-sg-role" {
  type = "ingress"
  from_port = 8080
  to_port = 8080
  protocol = "tcp"

  securityy_group_id = "${aws_securityy_group.terraformInternal-ELB-sg.id}"
  source_security_group_id = "${aws_securityy_group.terraform-web-sg.id}"
}

#terraform-Internal-ELB-sg 아웃바운드 규칙 추가
resource "aws_security_group_rule" "terraform-Internal-ELB-sg-role1" {
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  securityy_group_id = "${aws_securityy_group.terraform-Internal-ELB-sg.id}"
}