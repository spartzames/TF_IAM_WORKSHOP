locals {
  kthong-iam-workshop-01-profile-encrypted_password               = join("", aws_iam_user_login_profile.kthong-iam-workshop-01-profile.*.encrypted_password)
  kthong-iam-workshop-02-profile-encrypted_password               = join("", aws_iam_user_login_profile.kthong-iam-workshop-02-profile.*.encrypted_password)
  pgp_key_is_keybase               = length(regexall("keybase:", var.pgp_key)) > 0 ? true : false
  kthong-iam-workshop-01-profile-keybase_password_decrypt_command = local.pgp_key_is_keybase ? templatefile("templates/keybase_password_decrypt_command.sh", { encrypted_password = local.kthong-iam-workshop-01-profile-encrypted_password }) : ""
  kthong-iam-workshop-02-profile-keybase_password_decrypt_command = local.pgp_key_is_keybase ? templatefile("templates/keybase_password_decrypt_command.sh", { encrypted_password = local.kthong-iam-workshop-02-profile-encrypted_password }) : ""
}

