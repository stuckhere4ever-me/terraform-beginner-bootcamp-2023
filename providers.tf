terraform {
  required_providers {
   aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }

  # cloud {
  #   organization = "Raza"

  #   workspaces {
  #     name = "terra-house-1"
  #   }
  # }
}

provider "aws" {
  # Configuration options
}
