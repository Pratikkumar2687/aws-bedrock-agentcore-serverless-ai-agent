#############################################
# Terraform Variables
#############################################

variable "aws_region" {
  description = "AWS region where resources will be deployed"
  type        = string
  default     = "us-east-1"
}


variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
  default     = "bedrock-agentcore-ai-agent"
}


variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}


variable "lambda_runtime" {
  description = "AWS Lambda runtime"
  type        = string
  default     = "python3.12"
}


variable "lambda_timeout" {
  description = "Lambda execution timeout in seconds"
  type        = number
  default     = 30
}


variable "s3_force_destroy" {
  description = "Allow Terraform to delete S3 bucket with objects"
  type        = bool
  default     = false
}


variable "dynamodb_billing_mode" {
  description = "DynamoDB billing mode"
  type        = string
  default     = "PAY_PER_REQUEST"
}


variable "bedrock_agent_id" {
  description = "Amazon Bedrock Agent ID"
  type        = string
  default     = ""
}


variable "bedrock_knowledge_base_id" {
  description = "Amazon Bedrock Knowledge Base ID"
  type        = string
  default     = ""
}
