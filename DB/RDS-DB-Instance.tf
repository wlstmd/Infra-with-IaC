# RDS DB Instance 생성
resource "aws_db_instance" "terraform-DB" {
  allocated_storage = 10
  engine = "mysql"
  engine_version = "8.0.33"
  instance_class = "db.t2.micro"
  name = "terraformDB"
  username = "admin"
  password = "qwer1234"
  identifier = "terraform-db"
  skip_final_snapshot = true
  db_subnet_group_name = "terraform-subnet-group"
  vpc_security_group_ids = ["${aws_security_group.terraform-db-sg.id}"]
  multi_az = true
}