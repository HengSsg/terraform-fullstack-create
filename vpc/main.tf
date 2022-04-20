# vpc 리소스 생성
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  enable_dns_hostnames = true
  tags = {
    "Name" = "tutorial-vpc"
  }
}
# 퍼블릭 subnet리소스 생성
resource "aws_subnet" "public-a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public-a_subnet_cidr_block
  availability_zone = var.region-a
  tags = {
    "Name" = "Tutorial public-a"
  }
}

resource "aws_subnet" "public-c" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public-c_subnet_cidr_block
  availability_zone = var.region-c
  tags = {
    "Name" = "Tutorial public-c"
  }
}

# 프라이빗 subnet 리소스 생성
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private1_subnet_cidr_block
  availability_zone = var.region-a
  tags = {
    "Name" = "Tutorial private 1"
  }
}

resource "aws_subnet" "private-2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private2_subnet_cidr_block
  availability_zone = var.region-c
  tags = {
    "Name" = "Tutorial private 2"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    "Name" = "tutorial-igw"
  }
}

resource "aws_eip" "nat" {
  vpc = true
  tags = {
    "Name" = "tutorial-eip"
  }
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-c.id
  tags = {
    "Name" = "tutorial-nat"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags = {
    "Name" = "tutorial-rtb-pub"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  tags = {
    "Name" = "tutorial-rtb-pri"
  }
  route {
    cidr_block      = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public-a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

resource "aws_security_group" "vpc-sg" {
  vpc_id      = aws_vpc.main.id

 ingress     = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 80
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 80
        },
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 22
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 22
        }
    ]
  tags = {
    Name = "vpc-sg"
  }
}

resource "aws_security_group" "instance-sg" {
  vpc_id      = aws_vpc.main.id

 ingress     = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 80
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 80
        },
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 22
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 22
        },
         {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 3306
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 3306
        }
    ]
  tags = {
    Name = "vpc-sg"
  }
}


resource "aws_security_group" "db-sg" {
  vpc_id      = aws_vpc.main.id

 ingress     = [
          {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 3306
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 3306
        }
 ]
  tags = {
    Name = "db-sg"
  }
}

resource "aws_db_subnet_group" "sb_gruop" {
  name       = "main"
  subnet_ids = [aws_subnet.private-2.id, aws_subnet.private.id]

  tags = {
    Name = "My DB subnet group"
  }
}