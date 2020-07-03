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
  identity_pool_name = "${var.project}IdentityPool${var.environment}"
  allow_unauthenticated_identities = false
  cognito_identity_providers {
    client_id               = aws_cognito_user_pool_client.this.id
    provider_name           = aws_cognito_user_pool.this.endpoint
    server_side_token_check = false
  }
}

resource "aws_cognito_identity_pool_roles_attachment" "this" {
  identity_pool_id = aws_cognito_identity_pool.this.id
  roles = {
    "authenticated" = aws_iam_role.authenticated.arn
  }
}


data "aws_iam_policy_document" "assume_policy" {
  statement {
    effect = "Allow"
    principals  {
        type = "Federated"
        identifiers = ["cognito-identity.amazonaws.com"]
    }
    actions = ["sts:AssumeRoleWithWebIdentity"]

    condition {
      test     = "StringEquals"
      variable = "cognito-identity.amazonaws.com:aud"
      values = [
        aws_cognito_identity_pool.this.id,
      ]
    }
    condition {
      test     = "ForAnyValue:StringLike"
      variable = "cognito-identity.amazonaws.com:amr"
      values = [
        "authenticated",
      ]
    }
  }

}

data "aws_region" "current" {}

data "aws_iam_policy_document" "authenticated" {
  statement {
    effect = "Allow"

    actions = ["mobileanalytics:PutEvents", "cognito-sync:*", "cognito-identity:*"]

    resources = [
        "*"
        ]
  }
  statement {
    effect = "Allow"

    actions = ["execute-api:Invoke"]

    resources = [
        "arn:aws:execute-api:$${data.aws_region.current}:*:*"
        ]
  }

}

resource "aws_iam_role" "authenticated" {
  name = "cognito_authenticated"
  assume_role_policy = data.aws_iam_policy_document.assume_policy.json
}

resource "aws_iam_role_policy" "authenticated" {
  name = "authenticated_policy"
  role = aws_iam_role.authenticated.id
  policy = data.aws_iam_policy_document.authenticated.json
}