provider "aws" {
    region = "eu-central-1"
}

resource "aws_vpc" "Jenkins" {
  cidr_block = "10.92.0.0/16"
}
