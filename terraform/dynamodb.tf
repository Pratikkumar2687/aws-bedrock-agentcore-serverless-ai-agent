#############################################
# DynamoDB User Preferences Table
#############################################


resource "aws_dynamodb_table" "user_preferences" {


  name = "${var.project_name}-user-preferences-${var.environment}"


  billing_mode = var.dynamodb_billing_mode


  hash_key = "UserId"



  attribute {

    name = "UserId"

    type = "S"

  }



  tags = {

    Name = "${var.project_name}-user-preferences"

    Environment = var.environment

    Purpose = "Store AI Agent User Preferences"

  }


}



#############################################
# DynamoDB Point In Time Recovery
#############################################

resource "aws_dynamodb_table" "user_preferences_backup" {

  name = "${var.project_name}-agent-history-${var.environment}"


  billing_mode = "PAY_PER_REQUEST"


  hash_key = "RequestId"



  attribute {

    name = "RequestId"

    type = "S"

  }



  point_in_time_recovery {

    enabled = true

  }


  tags = {

    Name = "AI Agent Request History"

    Environment = var.environment

  }

}
