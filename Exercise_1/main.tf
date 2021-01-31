# TODO: Designate a cloud provider, region, and credentials
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2
resource "aws_instance" "Udacity_T2" {

  count         = 4
  instance_type = "t2.micro"
  ami           = var.ami
  subnet_id     = var.subnet_id
  tags = {
    class : "Udacity"
    Name : "Udacity T2"

  }
}

# TODO: provision 2 m4.large EC2 instances named Udacity M4
resource "aws_instance" "Udacity_M4" {
  count         = 2
  instance_type = "m4.large"
  ami           = var.ami
  tags = {
    class : "Udacity"
    Name : "Udacity M4"
  }

}
