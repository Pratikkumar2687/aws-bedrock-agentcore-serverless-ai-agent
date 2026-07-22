#############################################
# Terraform Outputs
#############################################


output "aws_region" {

  description = "AWS deployment region"

  value = var.aws_region

}



output "project_name" {

  description = "Project name"

  value = var.project_name

}



#############################################
# S3 Outputs
#############################################


output "knowledge_base_bucket_name" {

  description = "S3 bucket for Bedrock Knowledge Base documents"

  value = aws_s3_bucket.knowledge_base.bucket

}



output "knowledge_base_bucket_arn" {

  description = "S3 bucket ARN"

  value = aws_s3_bucket.knowledge_base.arn

}



#############################################
# DynamoDB Outputs
#############################################


output "user_preferences_table_name" {

  description = "DynamoDB User Preferences table name"

  value = aws_dynamodb_table.user_preferences.name

}



output "user_preferences_table_arn" {

  description = "DynamoDB User Preferences table ARN"

  value = aws_dynamodb_table.user_preferences.arn

}
