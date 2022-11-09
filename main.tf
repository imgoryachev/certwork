terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
//      version = "~> 4.16"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "app_builder" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = "builder"
  }
}

resource "aws_instance" "prod_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = "prod"
  }
}