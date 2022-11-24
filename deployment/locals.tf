# --- root/locals.tf ---

locals {
  location = "us-east-1"

  deployment = {
    Repo-1 = {
      repo = "GitHub-Account-Name/Repo-1-Name"
    }
    Repo-2 = {
      repo = "GitHub-Account-Name/Repo-2-Name"
    }
    Repo-3 = {
      repo = "GitHub-Account-Name/Repo-3-Name"
    }
    Repo-4 = {
      repo = "GitHub-Account-Name/Repo-4-Name"
    }
  }
}