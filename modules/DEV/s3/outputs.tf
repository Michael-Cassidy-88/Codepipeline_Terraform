output "s3_bucket" {
    value = aws_s3_bucket.codepipeline_bucket.id
}