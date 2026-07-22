# IAM Role for Lambda
# Implements least privilege security model


resource "aws_iam_role" "lambda_execution_role" {

  name = "${var.project_name}-lambda-role"


  assume_role_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Principal = {

          Service = "lambda.amazonaws.com"

        }

        Action = "sts:AssumeRole"

      }

    ]

  })

}



# Basic Lambda Logging Permission

resource "aws_iam_role_policy_attachment" "lambda_logs" {

  role = aws_iam_role.lambda_execution_role.name

  policy_arn =
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"

}



# Bedrock Access Policy

resource "aws_iam_policy" "bedrock_access" {

  name = "${var.project_name}-bedrock-policy"


  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Action = [

          "bedrock:InvokeModel",

          "bedrock:InvokeAgent"

        ]

        Resource = "*"

      }

    ]

  })

}



resource "aws_iam_role_policy_attachment" "bedrock_policy_attachment" {

  role = aws_iam_role.lambda_execution_role.name

  policy_arn = aws_iam_policy.bedrock_access.arn

}
