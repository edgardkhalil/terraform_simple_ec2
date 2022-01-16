terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "dev_vpc" {
  cidr_block = "10.1.1.0/26"

  tags = {
    Name = "dev_vpc"

  }
}
# Create Subnet
resource "aws_subnet" "dev_subnet" {
  cidr_block = "10.1.1.0/26"
  vpc_id     = aws_vpc.dev_vpc.id

  tags = {
    Name = "dev_subnet"
  }
}
#Create Ubuntu EC2 instance
resource "aws_instance" "test_ubuntu" {
  ami = "ami-08531832555a14fe2"
  instance_type = "t2.micro"
  key_name = "terraform_dev"

  tags = {
    Name = "test_ubuntu"

  }
}