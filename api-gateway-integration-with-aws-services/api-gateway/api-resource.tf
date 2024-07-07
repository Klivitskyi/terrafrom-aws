resource "aws_api_gateway_resource" "bucket" {
  rest_api_id = aws_api_gateway_rest_api.s3_api.id
  parent_id   = aws_api_gateway_rest_api.s3_api.root_resource_id
  path_part   = "{bucket}"
}

resource "aws_api_gateway_resource" "file" {
  rest_api_id = aws_api_gateway_rest_api.s3_api.id
  parent_id   = aws_api_gateway_resource.bucket.id
  path_part   = "{file}"
}
