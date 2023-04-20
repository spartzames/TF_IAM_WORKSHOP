resource "aws_iam_policy" "DepartmentalEC2AccessPolicy" {
    policy = file("./DepartmentalEC2AccessPolicy.json")
    name = "DepartmentalEC2AccessPolicy"
}

resource "aws_iam_policy" "ContractorRoleAssumptionPolicy" {
    policy = file("./ContractorRoleAssumptionPolicy.json")
    name = "ContractorRoleAssumptionPolicy"
}