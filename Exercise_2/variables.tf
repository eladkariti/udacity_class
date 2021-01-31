# TODO: Define the variable for aws_region
variable "region" {
  default     = "us-east-1"
  description = "the aws region"
}

variable "secret_key" {
  description = "Region us-east-1 secret key"
}

variable "access_key" {
  description = "Region us-east-1 access key"
}