output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id-a" {
  value = aws_subnet.public-a.id

}

output "public_subnet_id-c" {
  value = aws_subnet.public-c.id

}

output "private_subnet_id-1" {
  value = aws_subnet.private.id
  
}
output "private_subnet_id-2" {
  value = aws_subnet.private-2.id
  
}

output "aws_db_subnet_group_name"{
  value = aws_db_subnet_group.sb_gruop.name
}
output "aws_security_group" {
  value = aws_security_group.db-sg.id
}
output "instance-sg" {
  value = aws_security_group.instance-sg.id
}