resource "aws_iam_user" "John-kthong" {
  name = "John-kthong"  
  path = "/"
  force_destroy = true
  tags = {
    "department" : "HR"
  }
}

resource "aws_iam_user_login_profile" "John-kthong-profile" {
  user    = aws_iam_user.John-kthong.name
  password_reset_required = true
}

resource "aws_iam_user_policy_attachment" "John-kthong-policy-attach" {
  user = aws_iam_user.John-kthong.name
  policy_arn = aws_iam_policy.DepartmentalEC2AccessPolicy.arn
}

output "John-kthong-password" {
  value = aws_iam_user_login_profile.John-kthong-profile.encrypted_password
}

resource "aws_iam_user" "Sally-kthong" {
  name = "Sally-kthong"  
  path = "/"
  force_destroy = true
  tags = {
    "department" : "Finance"
  }
}

resource "aws_iam_user_login_profile" "Sally-kthong-profile" {
  user    = aws_iam_user.Sally-kthong.name
  password_reset_required = true
}

resource "aws_iam_user_policy_attachment" "Sally-kthong-policy-attach" {
  user = aws_iam_user.Sally-kthong.name
  policy_arn = aws_iam_policy.ContractorRoleAssumptionPolicy.arn
}

output "Sally-kthong-password" {
  value = aws_iam_user_login_profile.Sally-kthong-profile.encrypted_password
}

resource "aws_iam_user" "Anne-kthong" {
  name = "Anne-kthong"  
  path = "/"
  force_destroy = true
}

resource "aws_iam_user_login_profile" "Anne-kthong-profile" {
  user    = aws_iam_user.Anne-kthong.name
  password_reset_required = true
}

output "Anne-kthong-password" {
  value = aws_iam_user_login_profile.Anne-kthong-profile.encrypted_password
}

resource "aws_iam_user" "Bob-kthong" {
  name = "Bob-kthong"  
  path = "/"
  force_destroy = true
}

resource "aws_iam_user_login_profile" "Bob-kthong-profile" {
  user    = aws_iam_user.Bob-kthong.name
  password_reset_required = true
}

output "Bob-kthong-password" {
  value = aws_iam_user_login_profile.Bob-kthong-profile.encrypted_password
}