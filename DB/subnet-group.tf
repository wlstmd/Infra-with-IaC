# Subnet group 생성
resource "aws_db_subnet_group" "terraform-subnet-group" {
  name = "terraform-subnet-group"
  subnet_ids = [aws_subnet.terraform-db-1.id, aws_subnet.terraform-db-2.id]

  tags = {
    Name = "terraform-subnet-group"
  }
}