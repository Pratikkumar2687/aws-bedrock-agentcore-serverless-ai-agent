> 🚧 **Project Status: In Development**
>
> This project is a learning/reference implementation. AWS resources have not yet been deployed to a production environment.
>
> Architecture implementation, Terraform validation, and AWS deployment testing are currently in progress.

# AWS Bedrock AgentCore Serverless AI Agent

A serverless AI Agent reference architecture using **Amazon Bedrock AgentCore**, **Amazon Bedrock**, **AWS Lambda**, **Amazon API Gateway**, **RAG (Retrieval-Augmented Generation)**, and secure AWS services to provide intelligent recommendations based on user queries and location.

---

# 1. Overview

## Problem Statement

Modern applications increasingly require intelligent assistants that can understand user requests, retrieve relevant information, and provide personalized recommendations.

Traditional rule-based applications have limitations when handling:

- Natural language queries
- Context-aware conversations
- Personalized recommendations
- Dynamic information retrieval

This project demonstrates a serverless AI Agent architecture using AWS Generative AI services while focusing on scalability, security, and cloud-native design principles.

---

# Why AI Agent?

AI Agents provide the ability to:

- Understand natural language user queries
- Reason about user intent
- Retrieve relevant information from knowledge sources
- Use external tools and APIs
- Generate personalized responses
- Automate complex decision-making workflows


## Example Use Case

User query:

> "Find the best vegetarian Indian restaurants near ZIP code 02155"

The AI Agent can:

1. Understand user intent
2. Extract location information
3. Retrieve relevant knowledge from the RAG knowledge base
4. Analyze available information
5. Generate personalized recommendations

---

# Why Serverless Architecture?

A serverless architecture provides:

- Automatic scaling based on demand
- Reduced infrastructure management
- Pay-per-use cost model
- High availability
- Faster development and deployment

AWS Lambda and Amazon API Gateway allow applications to scale without managing traditional servers.

---

# 2. Architecture Diagram

```
                         User
                           |
                           |
                    Amazon API Gateway
                           |
                           |
                       AWS Lambda
                           |
                           |
                 Amazon Bedrock AgentCore
                           |
             --------------------------------
             |                              |
       Amazon Bedrock              Knowledge Base
             |                              |
             |                              |
     Foundation Models                     Amazon S3
                                            |
                                     Documents / Data



Supporting AWS Services:

DynamoDB        → Store User Preferences and Application Data

IAM             → Secure Access Control and Permissions

CloudWatch      → Logging, Monitoring, and Observability

Terraform       → Infrastructure as Code (IaC)

GitHub Actions  → CI/CD Automation
```

---

# 3. Features

## AI-Powered Recommendations

- Natural language query understanding
- Context-aware responses
- Personalized recommendations
- Location-based recommendations using ZIP code information


## Serverless API

- REST API using Amazon API Gateway
- AWS Lambda-based backend processing
- Automatic scaling without server management


## RAG-Based Responses

Retrieval-Augmented Generation architecture enables:

- Knowledge retrieval from Amazon S3 documents
- Grounded AI responses
- Improved response accuracy
- Reduced hallucination risk


## Secure AWS Integration

Includes:

- AWS Identity and Access Management (IAM)
- Secure service-to-service communication
- Least privilege permission model


## Infrastructure as Code

Using Terraform for:

- AWS resource provisioning
- Repeatable deployments
- Version-controlled infrastructure

---

# 4. Security Design

Security follows AWS cloud best practices.

---

## IAM Roles

The architecture uses IAM roles instead of storing AWS credentials.

Benefits:

- No hardcoded access keys
- Temporary credentials
- Controlled service permissions
- Least privilege security model


---

## No Hardcoded Credentials

Sensitive credentials are not stored in:

- Source code
- Configuration files
- GitHub repositories


Authentication uses:

- IAM roles
- AWS managed authentication mechanisms

---

## AWS Secrets Manager

Sensitive information can be stored securely using:

- AWS Secrets Manager
- Environment variables
- Secure secret rotation


---

## Encryption

Data protection includes:

### Encryption at Rest

Using:

- Amazon S3 encryption
- DynamoDB encryption


### Encryption in Transit

Using:

- HTTPS
- TLS communication


---

## API Security

Amazon API Gateway security considerations:

- Authentication
- Authorization
- Request validation
- Rate limiting
- Secure API access

---

# 5. Project Structure

```
aws-bedrock-agentcore-serverless-ai-agent/

│
├── README.md
│
├── architecture/
│   └── architecture-diagram.png
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── lambda.tf
│   ├── api_gateway.tf
│   ├── iam.tf
│   ├── s3.tf
│   ├── dynamodb.tf
│   └── terraform.tfvars
│
├── lambda/
│   └── agent_handler.py
│
├── knowledge-base/
│   └── restaurants.json
│
├── docs/
│   ├── architecture.md
│   ├── security.md
│   └── deployment.md
│
└── .github/
    └── workflows/
        └── deploy.yml
```

---

# 6. Deployment

## Prerequisites

Install:

- AWS CLI
- Terraform >= 1.6
- Git


Configure AWS credentials:

```bash
aws configure
```

---

## Initialize Terraform

```bash
terraform init
```

---

## Validate Terraform Configuration

```bash
terraform validate
```

---

## Review Infrastructure Changes

```bash
terraform plan
```

---

## Deploy AWS Infrastructure

```bash
terraform apply
```

---

# 7. Future Enhancements

Planned improvements:

- Complete Amazon Bedrock Knowledge Base integration
- Deploy and test AWS infrastructure
- Add restaurant/location APIs
- Add Amazon Cognito authentication
- Add CloudWatch dashboards
- Add automated CI/CD deployment pipeline
- Implement Terraform remote state management
- Add automated testing

---

# 8. Technology Stack

| Category | Technology |
|---|---|
| Generative AI | Amazon Bedrock, Bedrock AgentCore |
| AI Architecture | RAG (Retrieval-Augmented Generation) |
| Compute | AWS Lambda |
| API | Amazon API Gateway |
| Storage | Amazon S3, DynamoDB |
| Security | AWS IAM, AWS Secrets Manager |
| Monitoring | Amazon CloudWatch |
| Infrastructure | Terraform |
| CI/CD | GitHub Actions |
| Programming Language | Python |

---

# 9. Learning Objectives

This project demonstrates hands-on learning of:

- AWS Serverless Architecture
- Generative AI Application Design
- AI Agent Patterns
- RAG Architecture
- AWS Security Best Practices
- Infrastructure as Code
- Cloud Deployment Automation

---

# License

This project is created for learning, demonstration, and portfolio purposes.
