resource "aws_instance" "hr_ec2_kthong" {
  ami                    = "ami-0d9f286195031c3d9"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public-ap-southeast-2a.id
  vpc_security_group_ids = [aws_security_group.instance.id]
  tags = {
    Name = "HR",
    department = "HR"
  }
}

resource "aws_security_group" "resource-tagging-lab-kthong" {
  name = "resource-tagging-lab-kthong"
  vpc_id = aws_vpc.vpc_kthong.id
}

output "public_ip" {
  value       = aws_instance.hr_ec2_kthong.public_ip
  description = "The public IP of the Instance"
}

output "public_dns" {
  value       = aws_instance.hr_ec2_kthong.public_dns
  description = "The Public dns of the Instance"
}

output "private_ip" {
  value       = aws_instance.hr_ec2_kthong.private_ip
  description = "The Private_ip of the Instance"
}

resource "aws_instance" "finance_ec2_kthong" {
  ami                    = "ami-0d9f286195031c3d9"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public-ap-southeast-2a.id
  vpc_security_group_ids = [aws_security_group.instance.id]
  tags = {
    Name = "FINANCE",
    department = "FINANCE"
  }
}

resource "aws_security_group" "resource-tagging-lab-kthong" {
  name = "resource-tagging-lab-kthong"
  vpc_id = aws_vpc.vpc_kthong.id
}