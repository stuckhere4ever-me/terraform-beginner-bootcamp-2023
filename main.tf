
resource "random_string" "bucketname" {
  # Bucket Naming Rules
  # https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html

  # Random String Documentation
  # https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string
  
  length           = 16
  special          = false
  upper            = false
}

 resource "aws_s3_bucket" "example" {
  bucket = random_string.bucketname.result
  tags = {
    UserUuid = var.user_uuid

  }

  }
