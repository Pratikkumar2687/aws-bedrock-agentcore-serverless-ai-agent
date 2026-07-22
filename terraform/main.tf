# AWS Provider Configuration
# Main Terraform configuration file

terraform {
  required_version = ">= 1.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}


# Common Variables

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}


variable "project_name" {
  description = "Project Name"
  type        = string
  default     = "bedrock-agentcore-ai-agent"
}


# Lambda Execution Role Reference

module "lambda" {
  source = "./"

  project_name = var.project_name
}
