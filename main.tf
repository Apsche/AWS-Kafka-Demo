terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

data "aws_availability_zones" "azs" {
  state = "available"
}

resource "aws_vpc" "vpc" {
  cidr_block = "192.168.0.0/22"
}

resource "aws_subnet" "subnet_az1" {
  availability_zone = data.aws_availability_zones.azs.names[0]
  cidr_block        = "192.168.0.0/24"
  vpc_id            = aws_vpc.vpc.id
}

resource "aws_subnet" "subnet_az2" {
  availability_zone = data.aws_availability_zones.azs.names[1]
  cidr_block        = "192.168.1.0/24"
  vpc_id            = aws_vpc.vpc.id
}

resource "aws_subnet" "subnet_az3" {
  availability_zone = data.aws_availability_zones.azs.names[2]
  cidr_block        = "192.168.2.0/24"
  vpc_id            = aws_vpc.vpc.id
}

resource "aws_instance" "broker1" {
  ami           = "ami-0b5eea76982371e91"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

resource "aws_instance" "broker2" {
  ami           = "ami-0b5eea76982371e91"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

resource "aws_instance" "broker3" {
  ami           = "ami-0b5eea76982371e91"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}