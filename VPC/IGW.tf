#Internet Gateway 생성
resource "aws_internet_gateway" "terraform_IGW" {
  vpc_id = aws_vpc.terraform_vpc.id

  tags = {
    Name = "terraform_IGW"
  }
}