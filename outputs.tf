output "bucketname" {
 description = "BucketName for our static bucket"
 value = module.terrahouse_aws.bucket_name 
}