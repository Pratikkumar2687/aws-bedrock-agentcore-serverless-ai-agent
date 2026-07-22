# AWS Bedrock AgentCore AI Agent Architecture


## Overview

This document describes the architecture of a serverless Generative AI application using Amazon Bedrock AgentCore, AWS Lambda, API Gateway, and RAG-based knowledge retrieval.


## High-Level Flow


User
 |
 |
API Gateway
 |
 |
AWS Lambda
 |
 |
Amazon Bedrock AgentCore
 |
 -------------------------
 |                       |
Amazon Bedrock      Knowledge Base
 |                       |
LLM Model               |
                         |
                    Amazon S3
                         |
                  Documents/Data



## Components


## API Gateway

Provides a secure HTTP endpoint for client applications.

Responsibilities:

- Receive user requests
- Validate API calls
- Forward requests to Lambda


## AWS Lambda

Serverless compute layer.

Responsibilities:

- Process incoming requests
- Prepare AI agent prompts
- Invoke Bedrock AgentCore


## Amazon Bedrock AgentCore

AI Agent orchestration layer.

Responsibilities:

- Understand user intent
- Manage agent workflow
- Retrieve required information
- Generate AI responses


## Amazon Bedrock

Provides foundation models for Generative AI responses.


## Amazon S3 Knowledge Base

Stores:

- Restaurant information
- Business documents
- Reference data

Used for RAG-based responses.


## DynamoDB

Stores:

- User preferences
- Previous requests
- Application metadata


## Monitoring

Amazon CloudWatch provides:

- Application logs
- Lambda monitoring
- Operational visibility
