terraform {
  cloud {
    organization = "yong-org"
    workspaces {
      name = "learn-tfc-aws"
    }
  }

  /*   required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  } */

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-southeast-2dsage"
}

resource "aws_instance" "app_server" {
  ami               = "ami-0ed828ae690ef8b35"
  instance_type     = "t2.micro"
  subnet_id         = "subnet-0ed908ff7a320e89c"
  availability_zone = "ap-southeast-2a"

  tags = {
    Name = "Webserver2"
  }

  lifecycle {
    create_before_destroy = true
  }
}