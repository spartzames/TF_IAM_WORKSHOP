resource "aws_iam_role" "tfc-kthong-role" {
  name = "tfc-kthong-role"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRoleWithWebIdentity"
      Effect = "Allow"
      Principal = {
        Federated = "arn:aws:iam::789535401130:oidc-provider/app.terraform.io"
      }
      Condition = {
        StringEquals = {
            "app.terraform.io:aud" = "aws.workload.identity"
        }
        StringLike = {
            "app.terraform.io:sub" = [
                "organization:KAL_DevOps_PoC:project:kthong_prj:workspace:TF_IAM_WORKSHOP:run_phase:*"
            ]
        }
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "tfc-kthong-role" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  role       = aws_iam_role.tfc-kthong-role.name
}
