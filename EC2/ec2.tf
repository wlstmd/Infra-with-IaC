#bastion 인스턴스 생성
resource "aws_instance" "terraform-bastion" {
  ami = "ami-0f52ba4acb7f8f76a"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.terraform-public-1.id}"
  vpc_security_group_ids = ["${aws_security_group.terraform-bastion-sg.id}"]
  key_name = "${aws_key_pair.terraform_key.key_name}"

  association_public_ip_address = true

  tags = {
    Name = "terraform-bastion"
  }
}

# web1 인스턴스 생성
resource "aws_instance" "terraform-web-1" {
  ami = "ami-0f52ba4acb7f8f76a"
  instance_type = "t2.micro"
  user_data = "${file("web-data.sh")}"
  subnet_id = "${aws_subnet.terraform-web-1.id}"
  vpc_security_group_ids = ["${aws_security_group.terraform-web-sg.id}"]
  key_name = "${aws_key_pair.private_key.key_name}"

  association_public_ip_address = false

  tags = {
    Name = "terraform-web-1"
  }
}

# web2 인스턴스 생성
resource "aws_instance" "terraform-web-2" {
  ami = "ami-0f52ba4acb7f8f76a"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.terraform-web-2.id}"
  vpc_security_group_ids = ["${aws_security_group.terraform-web-sg.id}"]
  key_name = "${aws_key_pair.private_key.key_name}"
  user_data = "${file("web-data2.sh")}"

  associate_public_ip_address = false

  tags = {
    Name = "terraform-web-2"
  }
}

