variable "vpc_a_cidr" {
    type = string
}

variable "var_vpc_a_name" {
    type = object({
        Name = string
    })
}

variable "var_subnet" {
    type = string
}

variable "subnet_name" {
    type = object({
        Name = string
    }) 
}

variable "igw_name" {
    type = object({
        Name = string
    }) 
}

variable "ec2_name" {
    type = object({
        Name = string
    })
}

variable "default-route" {
    type = string
  
}

variable "var_ami" {
    type = string
}
