#public subnet 라우팅
resource "aws_route_table" "terraform-public-route" {
  vpc_id = aws_vpc.terraform_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform_IGW.id
  }

  tags = {
    Name = "terraform-public-route"
  }
}

#private subnet 라우팅
resource "aws_route_table" "terraform-private-route" {
  vpc_id = aws_vpc.terraform_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.terraform-NAT.id
  }

  tags = {
    Name = "terraform-private-route"
  }
}

#라우팅 테이블에 public subnet 추가
resource "aws_route_table_association" "public-route" {
  subnet_id = aws_subnet.terraform-public-1.id
  route_table_id = aws_route_table.terraform-public-route.id
}

resource "aws_route_table_association" "public-route1" {
  subnet_id = aws_subnet.terraform-public-2.id
  route_table_id = aws_route_table.terraform-public-route.id
}

