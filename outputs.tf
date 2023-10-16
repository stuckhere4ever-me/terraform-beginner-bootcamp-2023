output "bucketname" {
 description = "BucketName for our static bucket"
 value = module.terrahouse_aws.bucket_name 
}


output "s3_website_url" {
  description = "S3 Endpoint"
  value = module.terrahouse_aws.website_url
}