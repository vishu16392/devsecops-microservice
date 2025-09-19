terraform {
  required_version = ">= 1.0"
}

provider "aws" {
  region = var.region
}

# Example least-privilege IAM policy (sample)
resource "aws_iam_policy" "ecr_push_pull" {
  name = "ecr_push_pull_policy"
  description = "Minimal policy to push/pull ECR images"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:PutImage",
          "ecr:InitiateLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:CompleteLayerUpload"
        ]
        Resource = "*"
      }
    ]
  })
}
