 terraform {
  required_providers {
   aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }

}

 
 resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name
  tags = {
    UserUuid = var.user_uuid

  }

}
