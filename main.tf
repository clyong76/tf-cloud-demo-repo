terraform {
  /* cloud {
    organization = "yong-org"
    workspaces {
      name = "learn-tfc-aws"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  } */

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0ed828ae690ef8b35"
  instance_type = "t2.micro"
  subnet_id     = "subnet-082553927b4ae0f60"

  tags = {
    Name = "Webserver"
  }

  lifecycle {
    create_before_destroy = true
  }
}