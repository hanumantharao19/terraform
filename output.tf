output "s3_bucket" {
  description = "ID of the EC2 instance"
  value       = data.aws_s3_bucket.public.id
  }
