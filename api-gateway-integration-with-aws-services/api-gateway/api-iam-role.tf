data "aws_iam_policy_document" "s3_proxy_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["apigateway.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "s3_api_role" {
  name               = "s3-api-role"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.s3_proxy_policy.json
}

resource "aws_iam_policy" "s3_file_upload_policy" {
  name        = "file-upload-polic-dskaldsa"
  path        = "/"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
                "s3:PutObject",
                "s3:GetObject"
            ],
      "Effect": "Allow",
      "Resource": [
                "arn:aws:s3:::${aws_s3_bucket.testBucket.bucket}/*" 
            ]
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "file_upload_attachment" {
  role       = aws_iam_role.s3_api_role.name
  policy_arn = aws_iam_policy.s3_file_upload_policy.arn
}

resource "aws_iam_role_policy_attachment" "role_api_gateway_attachment" {
  role       = aws_iam_role.s3_api_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonAPIGatewayInvokeFullAccess"
}
