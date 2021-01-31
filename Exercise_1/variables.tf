variable "region" {
  default     = "us-east-1"
  description = "the aws region"
}

variable "vpc_id" {
  default     = "vpc-fd877780"
  description = "the default vpc"
}

variable "subnet_id" {
  default     = "subnet-77a14a46"
  description = "Subnet with public access"
}

variable "ami" {
  default     = "ami-047a51fa27710816e"
  description = "EC2 - Amazon Linux 2 AMI (HVM), SSD Volume Type"
}

variable "secret_key" {
  description = "Region us-east-1 secret key"
}

variable "access_key" {
  description = "Region us-east-1 access key"
}