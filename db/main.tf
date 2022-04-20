
resource "aws_db_instance" "tutorial-db" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "hengsgg"
  password             = "gkgkgk12!"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  publicly_accessible = false
  final_snapshot_identifier = true
  db_subnet_group_name = var.aws_db_subnet_group_name
  availability_zone = "ap-northeast-2c"
  port = 3306
}

