terraform {
  backend "s3" {
    bucket = "bar-bucket-test-terra"
    key    = "test/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_vpc" "Jenkins" {
  cidr_block = "10.92.0.0/16"
  tags = {
    Name = "Jenkins-TEST-VPC"
  }
}
