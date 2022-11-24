resource "aws_s3_bucket" "codepipeline_bucket" {
  bucket = "codepipeline-us-east-1-xxxxxxxxxxxxxx"
  force_destroy = true
}