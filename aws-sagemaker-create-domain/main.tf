#####################################################
# TERRAFORM.MAIN()
# author: bishrt@amazon.com
# @rel: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sagemaker_domain
# @rel: https://github.com/aws-samples/sagemaker-domain-vpconly-canvas-with-terraform
# @rel: https://aws.amazon.com/blogs/machine-learning/amazon-sagemaker-domain-in-vpc-only-mode-to-support-sagemaker-studio-with-auto-shutdown-lifecycle-configuration-and-sagemaker-canvas-with-terraform/
#####################################################

#####################################################
# PROVIDER CONFIG
#####################################################

# CHANGEME
provider "aws" {
    profile = var.aws_cli_user_profile
    region = var.aws_region
}

########################
# SAGEMAKER
########################

resource "aws_sagemaker_domain" "my_sagemaker_domain" {
  domain_name = var.sagemaker_domain_name
  auth_mode   = var.sagemaker_auth_type
  vpc_id      = var.aws_vpc_id
  subnet_ids  = [var.aws_subnet_id]

  default_user_settings {
    execution_role = aws_iam_role.my_sagemaker_iam_role.arn
  }

  default_space_settings {
    execution_role = aws_iam_role.my_sagemaker_iam_role.arn
  }

  domain_settings {
    
  }

  app_network_access_type = var.sagemaker_app_network_access_type

  tags = {
    Environment = var.sagemaker_tag_environment
    Owner = var.sagemaker_tag_owner
  }
}

# CHANGEME
locals {
    now_timestamp = formatdate("YYYYMMDDhhmmss", timestamp())
}


########################
# IAM
########################
# CHANGEME
resource "aws_iam_role" "my_sagemaker_iam_role" {
  name               = "MySageMakerUserExecutionRole-${local.now_timestamp}"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.my_sagemaker_assume_policy.json
  managed_policy_arns = [ "arn:aws:iam::aws:policy/AmazonSageMakerFullAccess"]
  
}

data "aws_iam_policy_document" "my_sagemaker_assume_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["sagemaker.amazonaws.com"]
    }
  }
}

########################
# SAGEMAKER.USER
########################
# CHANGEME
/*
resource "aws_sagemaker_user_profile" "default_sagemaker_user_profile" {
    domain_id = aws_sagemaker_domain.my_sagemaker_domain.id
    user_profile_name = var.default_sagemaker_user_profile_name
    single_sign_on_user_identifier = "UserName"
    single_sign_on_user_value = ""

    user_settings {
      execution_role = aws_iam_role.my_sagemaker_iam_role.arn
    }
}
*/

