variable "instance-sg" {
  type = string
}
variable "vpc_id" {
  type = string
}
variable "public_subnet_id-a" {
  type = string
}
variable "public_subnet_id-c" {
  type = string
}
variable "region-a" {
  type = string
  default = "ap-northeast-2a"
}
variable "region-c" {
  type = string
  default = "ap-northeast-2c"
}
variable "image_id" {
  type = string
}