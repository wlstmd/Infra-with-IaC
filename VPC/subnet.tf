# public subnet1 생성
resource "aws_subnet" "terraform-public-1" {
  vpc_id = "${aws_vpc.terraform_vpc.id}"
  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-northeast-2a"
  map_public_ip_on_launch = false
  
  tags = {
    Name = "terraform-public-1"
  }
}