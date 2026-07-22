# AWS Lambda Function
# Handles API requests and invokes AI Agent workflow


resource "aws_lambda_function" "ai_agent_lambda" {

  function_name = "${var.project_name}-lambda"

  filename = "lambda.zip"

  handler = "agent_handler.lambda_handler"

  runtime = "python3.12"

  role = aws_iam_role.lambda_execution_role.arn


  timeout = 30


  environment {

    variables = {

      BEDROCK_AGENT_ID = "your-agent-id"

      KNOWLEDGE_BASE_ID = "your-knowledge-base-id"

    }

  }


}


# Lambda CloudWatch Log Group

resource "aws_cloudwatch_log_group" "lambda_logs" {

  name = "/aws/lambda/${aws_lambda_function.ai_agent_lambda.function_name}"

  retention_in_days = 30

}
