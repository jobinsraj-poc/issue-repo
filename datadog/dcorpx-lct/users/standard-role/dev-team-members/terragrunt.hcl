# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# This is the configuration for Terragrunt, a thin wrapper for Terraform that supports locking and enforces best
# practices: https://github.com/gruntwork-io/terragrunt
# ---------------------------------------------------------------------------------------------------------------------

# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.

terraform {
   source = "git@github.com:Toyota-Motor-North-America/ace-aws-infra-modules-platform.git//monitoring/datadog/user?ref=v0.16.0"
}

include {
  path = find_in_parent_folders()
}

locals {
  
  role_name = "Datadog Standard"                          
  user_emails  = ["jobins.raj@toyota.com"] 
}

inputs = {
  dd_role           = local.role_name
  user_email        = local.user_emails
  
  dd_api_key_path = "/datadog/dcorpx-lct/api_key"
  dd_app_key_path = "/datadog/dcorpx-lct/app_key"          
}
