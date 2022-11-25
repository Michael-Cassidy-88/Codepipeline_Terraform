# Codepipeline_Terraform
Terraform Modules for an AWS Codepipeline using one codepipeline resource to create multiple pipelines from different GitHub Repos accroding to locals mapping. 

This project specifically uses a CodeStar Connection from AWS to GitHub.  A change to a "dev" branch triggers the pipeline.

A build stage follows, then a manual approval stage.

The deploy stage uses a SAM template to deploy a CloudFormation Stack and a Lambda Function.


