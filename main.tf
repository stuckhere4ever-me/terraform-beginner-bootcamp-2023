terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

provider "random" {
  # Configuration options
}

resource "random_string" "bucketname" {
  length           = 16
  special          = false
}

output "random_bucket_name" {
  value       = random_string.bucketname.id
}

output "random_bucket_result" {
  value       = random_string.bucketname.result
}