variable "aws_region" {
  default = "us-east-1"
}

variable "ami_id" {
  description = "Amazon Linux 2 AMI ID"
  default     = "ami-0c55b159cbfafe1f0" # Replace based on region
}

variable "instance_type" {
  default = "t2.micro"
}

variable "public_key_path" {
  description = "Path to your public key file (.pub)"
  default     = "~/.ssh/id_rsa.pub"
}
