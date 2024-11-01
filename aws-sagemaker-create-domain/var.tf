#####################################################
# TERRAFORM.VARIABLES
# author: bishrt
# description: variables for SageMaker Domain Creation via Terraform
#####################################################

# CHANGEME
variable "sagemaker_domain_name" {
    type = string
    default = "my-sagemaker-domain-bishrt"
}

# CHANGEME
variable "sagemaker_app_network_access_type" {
    type = string
    default = "VpcOnly"
}

# CHANGEME
variable "sagemaker_auth_type" {
    type = string
    default = "SSO"
}

# CHANGEME
variable "aws_cli_user_profile" {
    type = string
    default = "my-bishrt-okta-cli-user"
}

# CHANGEME
variable "aws_region" {
    type = string
    # us-east-1
    default = "us-east-1"
}

# CHANGEME
variable "aws_vpc_id" {
    type = string
    default = "vpc-0ff0b20aa0a18c45c"
}

# CHANGEME
variable "aws_subnet_id" {
    type = string
    default = "subnet-01c9958b295f761d7"
}

# CHANGEME
variable "aws_vpc_cidr_block" {
    type = string
    default = "172.31.0.0/16"
}

# CHANGEME
variable "default_sagemaker_user_profile_name" {
    type = string
    default = "johndoe"
}

variable "sagemaker_tag_environment" {
    type = string
    default = "DEV"
}

variable "sagemaker_tag_owner" {
    type = string
    default = "jdoe"
}
