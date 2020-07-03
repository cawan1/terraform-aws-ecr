resource "aws_cognito_user_pool" "this" {
  name = "${var.project}-${var.environment}-user-pool"

  username_attributes = ["email"]
  auto_verified_attributes = ["email"]

}

resource "aws_cognito_user_pool_client" "this" {
  name = "${var.project}-${var.environment}-user-pool-client"

  user_pool_id = aws_cognito_user_pool.this.id
  explicit_auth_flows = ["ADMIN_NO_SRP_AUTH"]
  generate_secret     = false
}


resource "aws_cognito_identity_pool" "this" {
  identity_pool_name               = "${var.project}-${var.environment}-identity-pool"
  allow_unauthenticated_identities = false

  cognito_identity_providers {
    client_id               = aws_cognito_user_pool_client.this.id
    provider_name           = aws_cognito_user_pool.this.endpoint
    server_side_token_check = false
  }




resource "aws_cognito_identity_pool_roles_attachment" "main" {
  identity_pool_id = aws_cognito_identity_pool.this.id

  roles = {
    "authenticated" = "${aws_iam_role.authenticated.arn}"
  }
}



resource "aws_iam_role" "authenticated" {
  name = "cognito_authenticated"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "cognito-identity.amazonaws.com"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "cognito-identity.amazonaws.com:aud": "${aws_cognito_identity_pool.this.id}
        },
        "ForAnyValue:StringLike": {
          "cognito-identity.amazonaws.com:amr": "authenticated"
        }
      }
    }
  ]
}
EOF
}

data "aws_region" "current" {}

resource "aws_iam_role_policy" "authenticated" {
  name = "authenticated_policy"
  role = "${aws_iam_role.authenticated.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "mobileanalytics:PutEvents",
        "cognito-sync:*",
        "cognito-identity:*"
      ],
      "Resource": [
        "*"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "execute-api:Invoke",
      ],
      "Resource": [
        "arn:aws:execute-api:${data.aws_region.current}:*:*"
      ]
    }

  ]
}
EOF
}
