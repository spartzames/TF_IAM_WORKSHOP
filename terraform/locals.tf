locals {
  encrypted_password               = join("", aws_iam_user_login_profile.example.*.encrypted_password)
  pgp_key_is_keybase               = length(regexall("keybase:", var.pgp_key)) > 0 ? true : false
  keybase_password_decrypt_command = local.pgp_key_is_keybase ? templatefile("templates/keybase_password_decrypt_command.sh", { encrypted_password = local.encrypted_password }) : ""
}

