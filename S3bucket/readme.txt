

 Step 1: Install Terraform

Download from: Terraform Downloads

Verify:


terraform -v


---

terraform need to connect to AWS console
use the AWS CLI and do the configuration for aws configure
later teraform will use this config to connect 

📂 Step 2: Project Structure

Create a folder for your demo:

terraform-demo/
 ├── main.tf
 ├── variables.tf   (optional, for params)
 └── outputs.tf     (optional, for results)


---

📝 Step 3: main.tf (S3 Bucket Example)

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


---

📝 Step 4: outputs.tf

output "bucket_name" {
  value = aws_s3_bucket.demo_bucket.bucket
}


---

▶️ Step 5: Run Commands

Inside terraform-demo/:

terraform init       # downloads AWS provider plugin
terraform validate   # check syntax
terraform plan       # preview changes
terraform apply      # create bucket (confirm with yes)


---

🗑 Step 6: Destroy When Done

terraform destroy


---


                     
