provider "aws" {
    region = "us-east-1"
}

# # Create VPC's
resource "aws_vpc" "VPC-A" {
  cidr_block       = var.vpc_a_cidr
  tags = var.var_vpc_a_name
}

#Create Subnet

resource "aws_subnet" "Subnet-1" {
  vpc_id     = aws_vpc.VPC-A.id
  cidr_block = var.var_subnet
  map_public_ip_on_launch = "true"

  tags = var.subnet_name
}

# Create IGW:
resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.VPC-A.id

  tags = var.igw_name
}


# Retrieve AWS EC2 Key pair

data "aws_key_pair" "my_key" {
  key_name = "NEW-KEY"
}

# Create EC2

resource "aws_instance" "VPC-A-EC2" {
  ami           = var.var_ami
  instance_type = "t2.micro"
  subnet_id = aws_subnet.Subnet-1.id
  key_name = data.aws_key_pair.my_key.key_name
  security_groups = [aws_security_group.VPC-A-SG.id]

  tags = var.ec2_name
}

# Create Route Table

resource "aws_route_table" "VPC-A-RT" {
  vpc_id = aws_vpc.VPC-A.id

  route {
    cidr_block = var.default-route
    gateway_id = aws_internet_gateway.IGW.id
  }
    tags = var.rt-name
}


# Create Security Group

resource "aws_security_group" "VPC-A-SG" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.VPC-A.id

  ingress {
    description      = "SSH from My-PC"
    from_port        = 0
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.myip]
  }
  
  tags = var.sg_name
}
