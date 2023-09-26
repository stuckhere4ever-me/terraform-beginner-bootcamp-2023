terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }

    aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

provider "random" {
  # Configuration options
}


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

  }
 

output "random_bucket_name" {
  value       = random_string.bucketname.result
}

