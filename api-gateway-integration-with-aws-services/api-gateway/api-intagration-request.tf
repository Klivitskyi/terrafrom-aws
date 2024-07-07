resource "aws_api_gateway_integration" "FilePut-Integration" {
    rest_api_id = aws_api_gateway_rest_api.s3_api.id
    resource_id = aws_api_gateway_resource.file.id
    http_method = aws_api_gateway_method.FilePutMethod.http_method
    
    type                    = "AWS"
    integration_http_method = "PUT"
    uri                     = "arn:aws:apigateway:${var.region}:s3:path/${aws_s3_bucket.testBucket.bucket}/{file}"

    credentials = aws_iam_role.s3_api_role.arn

    request_parameters = {
        "integration.request.path.file" = "method.request.path.file",
        "integration.request.path.bucket" = "method.request.path.bucket"
  }
}

resource "aws_api_gateway_integration" "FileGet-Integration" {
    rest_api_id = aws_api_gateway_rest_api.s3_api.id
    resource_id = aws_api_gateway_resource.file.id
    http_method = aws_api_gateway_method.FileGetMethod.http_method

    type                    = "AWS"
    integration_http_method = "GET"
    uri                     = "arn:aws:apigateway:${var.region}:s3:path/${aws_s3_bucket.testBucket.bucket}/{file}"

    credentials = aws_iam_role.s3_api_role.arn

  request_parameters = {
        "integration.request.path.file" = "method.request.path.file",
        "integration.request.path.bucket" = "method.request.path.bucket"
   }
}

resource "aws_api_gateway_integration" "FileOptions-Integration" {
    rest_api_id = aws_api_gateway_rest_api.s3_api.id
    resource_id = aws_api_gateway_resource.file.id
    http_method = aws_api_gateway_method.FileOptionsMethod.http_method

    type        = "MOCK"
    depends_on  = [aws_api_gateway_method.FileOptionsMethod]

    request_templates = {
    "application/json" = <<EOF
        {
        "statusCode" : 200
        }
    EOF
    }
}