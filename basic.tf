provider "aws" {
    region = "eu-central-1"
}

resource "aws_instance" "foo" {
  ami           = "ami-01d9d7f15bbea00b7"
  instance_type = "t2.micro"
}
