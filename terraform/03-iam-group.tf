resource "aws_iam_group" "Contractors-kthong" {
  name = "Contractors-kthong"
  path = "/"
}

resource "aws_iam_group_membership" "Contractors-kthong-membership" {
  name = aws_iam_group.Contractors-kthong.name

  users = [
    aws_iam_user.John-kthong.name,
    aws_iam_user.Sally-kthong.name,
    aws_iam_user.Anne-kthong.name,
    aws_iam_user.Bob-kthong.name,
  ]

  group = aws_iam_group.Contractors-kthong.name
}

resource "aws_iam_group_policy_attachment" "Contractors-kthong-policy-attach" {
  group      = aws_iam_group.Contractors-kthong.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}