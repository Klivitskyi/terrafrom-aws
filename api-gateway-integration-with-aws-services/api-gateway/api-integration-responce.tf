resource "aws_api_gateway_integration_response" "FilePutMethod_IntegrationResponse" {
  rest_api_id = aws_api_gateway_rest_api.s3_api.id
  resource_id = aws_api_gateway_resource.file.id
  http_method = aws_api_gateway_method.FilePutMethod.http_method
  status_code = aws_api_gateway_method_response.FilePutMethod200Response.status_code

  response_templates = {
    "application/json" = ""
  }

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }
}

resource "aws_api_gateway_integration_response" "FileGetMethod_IntegrationResponse" {
  rest_api_id = aws_api_gateway_rest_api.s3_api.id
  resource_id = aws_api_gateway_resource.file.id
  http_method = aws_api_gateway_method.FileGetMethod.http_method
  status_code = aws_api_gateway_method_response.FileGetMethod200Response.status_code

  response_templates = {
    "application/json" = ""
  }

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }
}

resource "aws_api_gateway_integration_response" "FileOptionsMethod_IntegrationResponse" {
  rest_api_id = aws_api_gateway_rest_api.s3_api.id
  resource_id = aws_api_gateway_resource.file.id
  http_method = aws_api_gateway_method.FileOptionsMethod.http_method
  status_code = aws_api_gateway_method_response.FileOptionsMethod200Response.status_code

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,x-amz-meta-fileinfo'"
    "method.response.header.Access-Control-Allow-Methods" = "'GET,PUT,OPTIONS'"
    "method.response.header.Access-Control-Allow-Origin"  = "'*'"
  }

  response_templates = {
    "application/json" = ""
  }

  depends_on = [aws_api_gateway_method_response.FileOptionsMethod200Response]
}
