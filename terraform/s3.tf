#############################################
# S3 Bucket - AI Knowledge Base Storage
#############################################


resource "aws_s3_bucket" "knowledge_base" {

  bucket = "${var.project_name}-knowledge-base-${var.environment}"

  force_destroy = var.s3_force_destroy


  tags = {

    Name = "${var.project_name}-knowledge-base"

    Environment = var.environment

    Purpose = "Bedrock RAG Knowledge Base"

  }

}



#############################################
# Enable S3 Encryption
#############################################

resource "aws_s3_bucket_server_side_encryption_configuration" "knowledge_base_encryption" {

  bucket = aws_s3_bucket.knowledge_base.id


  rule {

    apply_server_side_encryption_by_default {

      sse_algorithm = "AES256"

    }

  }

}



#############################################
# Block Public Access
#############################################

resource "aws_s3_bucket_public_access_block" "knowledge_base_block" {

  bucket = aws_s3_bucket.knowledge_base.id


  block_public_acls = true

  block_public_policy = true

  ignore_public_acls = true

  restrict_public_buckets = true

}



#############################################
# Versioning
#############################################

resource "aws_s3_bucket_versioning" "knowledge_base_versioning" {

  bucket = aws_s3_bucket.knowledge_base.id


  versioning_configuration {

    status = "Enabled"

  }

}
