#NAT Gateway 생성
resource "aws_nat_gateway" "terraform-NAT" {
  allocation_id = aws_eip.terraform-NAT-eip.id
  subnet_id = aws_subnet.terraform-public-1.id
  
  tags = {
    Name = "terraform-NAT"
  }
}