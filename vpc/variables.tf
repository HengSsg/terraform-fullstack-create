# main에서 변수 값을 지정할 수 있음
variable "vpc_cidr_block" {
  type = string
}

variable "public-a_subnet_cidr_block" {
  type = string

}

variable "public-c_subnet_cidr_block" {
  type = string

}

variable "private1_subnet_cidr_block" {
  type = string
}

variable "private2_subnet_cidr_block" {
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