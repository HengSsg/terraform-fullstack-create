output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id-a" {
  value = module.vpc.public_subnet_id-a
}
output "public_subnet_id-c" {
  value = module.vpc.public_subnet_id-c
}

output "private_subnet_id-1" {
  value = module.vpc.private_subnet_id-1
}
output "private_subnet_id-2" {
  value = module.vpc.private_subnet_id-2
}
output "aws_db_subnet_group_name" {
  value = module.vpc.aws_db_subnet_group_name
}
output "security_group_name" {
  value = module.vpc.aws_security_group
}
output "instance-sg" {
  value = module.vpc.instance-sg
}