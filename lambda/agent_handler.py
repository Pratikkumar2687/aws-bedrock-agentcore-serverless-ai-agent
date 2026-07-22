"""
AWS Lambda Handler for Bedrock AgentCore AI Recommendation Agent

Flow:

API Gateway
      |
      v
AWS Lambda
      |
      v
Amazon Bedrock AgentCore
      |
      v
Amazon Bedrock Foundation Model + RAG Knowledge Base

"""

import json
import os
import boto3
import logging
from botocore.exceptions import ClientError


# ---------------------------------------------
# Logging Configuration
# ---------------------------------------------

logger = logging.getLogger()

logger.setLevel(logging.INFO)


# ---------------------------------------------
# AWS Clients
# ---------------------------------------------

bedrock_agent_client = boto3.client(
    "bedrock-agent-runtime"
)


# ---------------------------------------------
# Environment Variables
# ---------------------------------------------

BEDROCK_AGENT_ID = os.environ.get(
    "BEDROCK_AGENT_ID"
)

BEDROCK_AGENT_ALIAS_ID = os.environ.get(
    "BEDROCK_AGENT_ALIAS_ID",
)


# ---------------------------------------------
# Lambda Handler
# ---------------------------------------------

def lambda_handler(event, context):

    try:

        logger.info(
            "Received request: %s",
            json.dumps(event)
        )


        # -----------------------------------------
        # Parse API Gateway Request
        # -----------------------------------------

        body = event.get(
            "body",
            "{}"
        )


        request_body = json.loads(body)


        user_query = request_body.get(
            "query"
        )


        zip_code = request_body.get(
            "zip_code"
        )


        if not user_query:

            return response(
                400,
                {
                    "error": "Query parameter is required"
                }
            )


        # -----------------------------------------
        # Build Agent Prompt
        # -----------------------------------------

        prompt = f"""

You are a vegetarian food recommendation assistant.

User Request:

{user_query}


Location ZIP Code:

{zip_code}


Provide recommendations using available knowledge base data.

Include:

- Restaurant name
- Cuisine type
- Location
- Rating
- Why it matches the request

"""


        # -----------------------------------------
        # Invoke Bedrock AgentCore
        # -----------------------------------------

        agent_response = invoke_bedrock_agent(
            prompt
        )


        return response(
            200,
            {
                "message": "AI recommendation generated successfully",
                "recommendation": agent_response
            }
        )


    except Exception as error:

        logger.exception(
            "Error processing request"
        )


        return response(
            500,
            {
                "error": str(error)
            }
        )


# ---------------------------------------------
# Invoke Amazon Bedrock Agent
# ---------------------------------------------

def invoke_bedrock_agent(prompt):


    try:

        response = bedrock_agent_client.invoke_agent(

            agentId=BEDROCK_AGENT_ID,

            agentAliasId=BEDROCK_AGENT_ALIAS_ID,

            sessionId="session-001",

            inputText=prompt

        )


        completion = ""


        for event in response.get(
            "completion",
            []
        ):

            chunk = event.get(
                "chunk"
            )


            if chunk:

                completion += (
                    chunk["bytes"]
                    .decode("utf-8")
                )


        return completion



    except ClientError as error:


        logger.error(
            "Bedrock Agent invocation failed: %s",
            error
        )


        raise error



# ---------------------------------------------
# API Response Helper
# ---------------------------------------------

def response(
    status_code,
    body
):

    return {

        "statusCode": status_code,

        "headers": {

            "Content-Type": "application/json",

            "Access-Control-Allow-Origin": "*"

        },

        "body": json.dumps(body)

    }
