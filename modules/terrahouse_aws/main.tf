 terraform {
  required_providers {
   aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }

}

 
 resource "aws_s3_bucket" "static_website_bucket" {
  bucket = var.bucket_name
  tags = {
    UserUuid = var.user_uuid

  }
 }

resource "aws_s3_bucket_website_configuration" "website_configuration" {
  bucket = aws_s3_bucket.static_website_bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}
resource "aws_s3_object" "uploaded_index_file" {
  bucket = aws_s3_bucket.static_website_bucket.bucket
  key    = "index.html"
  source = var.index_html_filepath
  etag = filemd5(var.index_html_filepath)
}

resource "aws_s3_object" "uploaded_error_file" {
  bucket = aws_s3_bucket.static_website_bucket.bucket
  key    = "error.html"
  source = var.error_html_filepath
  etag = filemd5(var.error_html_filepath)
}