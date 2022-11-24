provider "aws" {
  region = local.location
}

module "codepipeline" {
  source                  = "../modules/DEV/codepipeline"
  for_each                = local.deployment
  repository_in           = each.value.repo
  name_in                 = each.key
  codebuild_project_name  = module.codebuild.codebuild_project_name
  s3_bucket_name          = module.s3.s3_bucket
  iam_role_arn            = module.iam.role_arn
  codestar_connection_arn = module.codestar_connection.codestar_arn
}

module "codebuild" {
  source                 = "../modules/DEV/codebuild"
  codebuild_project_name = "Project-Name"
}

module "codestar_connection" {
  source = "../modules/DEV/codestar_connection"
}

module "iam" {
  source = "../modules/DEV/iam"
}

module "s3" {
  source = "../modules/DEV/s3"
}