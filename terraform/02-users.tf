resource "aws_iam_user" "kthong-iam-workshop-01" {
  name = "kthong-iam-workshop-01"  
  path = "/"
  force_destroy = true
  tags = {
    "department" : "HR"
  }
}

resource "aws_iam_user_login_profile" "kthong-iam-workshop-01-profile" {
  user    = aws_iam_user.kthong-iam-workshop-01.name
  pgp_key = "${base64encode(file("iam.gpg.pubkey"))}"
  password_reset_required = true
}

resource "aws_iam_user_policy_attachment" "kthong-iam-workshop-01-policy-attach" {
  user = aws_iam_user.kthong-iam-workshop-01.name
  policy_arn = aws_iam_policy.DepartmentalEC2AccessPolicy.arn
}

output "kthong-iam-workshop-01-password" {
  value = aws_iam_user_login_profile.kthong-iam-workshop-01-profile.encrypted_password
}

resource "aws_iam_user" "kthong-iam-workshop-02" {
  name = "kthong-iam-workshop-02"  
  path = "/"
  force_destroy = true
  tags = {
    "department" : "Finance"
  }
}

resource "aws_iam_user_login_profile" "kthong-iam-workshop-02-profile" {
  user    = aws_iam_user.kthong-iam-workshop-02.name
  pgp_key = var.pgp_key
  password_reset_required = true
}

resource "aws_iam_user_policy_attachment" "kthong-iam-workshop-02-policy-attach" {
  user = aws_iam_user.kthong-iam-workshop-02.name
  policy_arn = aws_iam_policy.ContractorRoleAssumptionPolicy.arn
}

output "kthong-iam-workshop-02-password" {
  value = aws_iam_user_login_profile.kthong-iam-workshop-02-profile.encrypted_password
}

