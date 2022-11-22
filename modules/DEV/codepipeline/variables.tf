# Repo details

variable "repository_in" {
}

variable "name_in"{  
}

# Deployment details

variable "codebuild_project_name" {
}

variable "namespace" {
  default = "global"
}

# S3 Bucket, IAM Role, Codestar Connection

variable "s3_bucket_name" {
}

variable "iam_role_arn" {
}

variable "codestar_connection_arn" {
}