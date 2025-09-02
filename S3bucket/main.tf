# Define AWS provider
provider "aws" {
  region = "us-east-1"
}

# Create S3 bucket
resource "aws_s3_bucket" "demo_bucket" {
  bucket = "rushi-terraform-demo-bucket-12345"  # must be globally unique
  acl    = "private"

  tags = {
    Name        = "TerraformDemoBucket"
    Environment = "Dev"
  }
}
