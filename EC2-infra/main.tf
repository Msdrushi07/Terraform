provider "aws" {
  region = var.aws_region
}

# Create a key pair (you need a local public key file)
resource "aws_key_pair" "rushi_key" {
  key_name   = "rushi-key"
  public_key = file(var.public_key_path) # path to your .pub file
}

# Create security group to allow SSH (port 22) + HTTP (port 80)
resource "aws_security_group" "rushi_sg" {
  name        = "rushi-sg"
  description = "Allow SSH and HTTP inbound traffic"
  vpc_id      = "default" # will attach to default VPC

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rushi-sg"
  }
}

# Launch EC2 instance
resource "aws_instance" "rushi_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.rushi_key.key_name
  vpc_security_group_ids = [aws_security_group.rushi_sg.id]

  tags = {
    Name = "TerraformEC2Demo"
  }
}
