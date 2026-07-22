# API Gateway REST API
# Provides secure HTTP endpoint for AI Agent


resource "aws_api_gateway_rest_api" "ai_agent_api" {

  name = "${var.project_name}-api"

  description = "API Gateway for Bedrock AgentCore AI Agent"

}


resource "aws_api_gateway_resource" "agent_resource" {

  rest_api_id = aws_api_gateway_rest_api.ai_agent_api.id

  parent_id = aws_api_gateway_rest_api.ai_agent_api.root_resource_id

  path_part = "recommend"

}


resource "aws_api_gateway_method" "post_method" {

  rest_api_id = aws_api_gateway_rest_api.ai_agent_api.id

  resource_id = aws_api_gateway_resource.agent_resource.id

  http_method = "POST"

  authorization = "NONE"

}


resource "aws_api_gateway_integration" "lambda_integration" {

  rest_api_id = aws_api_gateway_rest_api.ai_agent_api.id

  resource_id = aws_api_gateway_resource.agent_resource.id

  http_method = aws_api_gateway_method.post_method.http_method

  integration_http_method = "POST"

  type = "AWS_PROXY"

  uri = aws_lambda_function.ai_agent_lambda.invoke_arn

}
