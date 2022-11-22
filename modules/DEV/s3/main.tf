resource "aws_s3_bucket" "codepipeline_bucket" {
  bucket = "globally-unique-bucket-name-here"
  force_destroy = true
}