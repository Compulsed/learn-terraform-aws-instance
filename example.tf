terraform {
  backend "remote" {
    organization = "dalesalter"

    workspaces {
      name = "learn-terraform-aws-instance"
    }
  }
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "dale-playground"
  region  = "us-east-1"
}

# resource "aws_instance" "example" {
#   ami           = "ami-0be2609ba883822ec"
#   instance_type = "t2.micro"
# }

# resource "aws_eip" "ip" {
#   vpc      = true
#   instance = aws_instance.example.id
# }

# output "ip" {
#   value = aws_eip.ip.public_ip
# }

resource "aws_s3_bucket" "dalesalter-memes-tf-bucket" {
  bucket = "dalesalter-memes-tf-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_rds_cluster" "default" {
  cluster_identifier      = "aurora-cluster-demo"
  engine                  = "aurora-postgresql"
  engine_mode             = "serverless"
  availability_zones      = ["us-east-1a", "us-east-1b", "us-east-1c"]
  database_name           = "mydb"
  master_username         = "foofoofoo"
  master_password         = "foofoofoo"
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
}