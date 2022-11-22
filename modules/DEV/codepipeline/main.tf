resource "aws_codepipeline" "pipeline" {
 name = "${var.name_in}"
  role_arn = var.iam_role_arn

  artifact_store {
    location = var.s3_bucket_name
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        ConnectionArn    = var.codestar_connection_arn
        FullRepositoryId = "${var.repository_in}"
        BranchName       = "dev"
        }
    }
  }

  stage {
    name = "Build"


    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
      version          = "1"

      configuration = {
        ProjectName = "${var.codebuild_project_name}"
      }
    }
  }

  stage {
  name = "Manual_Approval"
  action {
    name     = "Manual-Approval"
    category = "Approval"
    owner    = "AWS"
    provider = "Manual"
    version  = "1"
  }
}

  stage {
    name = "Deploy"

    action {
      name            = "CreateChangeSet"
      version         = "1"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "CloudFormation"
      input_artifacts = ["build_output"]
      run_order       = 1

      configuration = {
        ActionMode    = "CHANGE_SET_REPLACE"
        StackName     = "${var.name_in}"
        ChangeSetName = "${var.name_in}-changes"
        RoleArn       = var.iam_role_arn
        TemplatePath  = "build_output::outputtemplate.yml"
      }
    }

    action {
      name             = "DeployChangeSet"
      version          = "1"
      category         = "Deploy"
      owner            = "AWS"
      provider         = "CloudFormation"
      output_artifacts = ["cf_artifacts"]
      run_order        = 2

      configuration = {
        ActionMode    = "CHANGE_SET_EXECUTE"
        StackName     = "${var.name_in}"
        ChangeSetName = "${var.name_in}-changes"
      }
    }
  }
}