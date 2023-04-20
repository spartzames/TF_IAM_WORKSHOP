resource "aws_iam_policy" "DepartmentalEC2AccessPolicy" {
    policy = file("./../env/DepartmentalEC2AccessPolicy.json")
    name = "DepartmentalEC2AccessPolicy_kthong"
}

resource "aws_iam_policy" "ContractorRoleAssumptionPolicy" {
    policy = file("./../env/ContractorRoleAssumptionPolicy.json")
    name = "ContractorRoleAssumptionPolicy_kthong"
}