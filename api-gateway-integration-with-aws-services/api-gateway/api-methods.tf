resource "aws_api_gateway_method" "FilePutMethod" {
    rest_api_id      = aws_api_gateway_rest_api.s3_api.id
    resource_id      = aws_api_gateway_resource.file.id
    http_method      = "PUT"
    authorization    = "NONE"

    request_parameters = {
        "method.request.path.bucket" = true
        "method.request.path.file" = true
    }
}

resource "aws_api_gateway_method" "FileOptionsMethod" {
    rest_api_id        = aws_api_gateway_rest_api.s3_api.id
    resource_id        = aws_api_gateway_resource.file.id
    http_method        = "OPTIONS"
    authorization      = "NONE"

}

resource "aws_api_gateway_method" "FileGetMethod" {
    rest_api_id      = aws_api_gateway_rest_api.s3_api.id
    resource_id      = aws_api_gateway_resource.file.id
    http_method      = "GET"
    authorization    = "NONE"

    request_parameters = {
        "method.request.path.bucket" = true
        "method.request.path.file" = true
    }
}