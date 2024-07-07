resource "aws_api_gateway_rest_api" "s3_api" {
    name        = "S3API"
    description = "S3 REST API Gateway"
    binary_media_types = var.supported_binary_media_types
}

resource "aws_api_gateway_deployment" "deployment" {
    depends_on = [ aws_api_gateway_integration.FileGet-Integration, aws_api_gateway_integration.FilePut-Integration ]

    rest_api_id = aws_api_gateway_rest_api.s3_api.id
    stage_name  = "test"
}
