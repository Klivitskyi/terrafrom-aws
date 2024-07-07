resource "aws_api_gateway_method_response" "FilePutMethod200Response" {
  rest_api_id = aws_api_gateway_rest_api.s3_api.id
  resource_id = aws_api_gateway_resource.file.id
  http_method = aws_api_gateway_method.FilePutMethod.http_method
  status_code = "200"

  response_models = {
    "application/json" = "Empty"
  }

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = true
  }

  depends_on = [ aws_api_gateway_method.FilePutMethod ]
}

resource "aws_api_gateway_method_response" "FileOptionsMethod200Response" {
  rest_api_id = aws_api_gateway_rest_api.s3_api.id
  resource_id = aws_api_gateway_resource.file.id
  http_method = aws_api_gateway_method.FileOptionsMethod.http_method
  status_code = "200"

  response_models = {
    "application/json" = "Empty"
  }

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = true
    "method.response.header.Access-Control-Allow-Methods" = true
    "method.response.header.Access-Control-Allow-Origin"  = true
  }

  depends_on = [aws_api_gateway_method.FileOptionsMethod]
}

resource "aws_api_gateway_method_response" "FileGetMethod200Response" {
  rest_api_id = aws_api_gateway_rest_api.s3_api.id
  resource_id = aws_api_gateway_resource.file.id
  http_method = aws_api_gateway_method.FileGetMethod.http_method
  status_code = "200"

  response_models = {
    "application/json" = "Empty"
  }

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = true
  }

  depends_on = [aws_api_gateway_method.FileGetMethod]
}
