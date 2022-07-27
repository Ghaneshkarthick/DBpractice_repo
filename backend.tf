terraform {
  backend "s3" {
    bucket         = "talent-academy-g-bucket"
    key            = "talent-academy/Ec2-Lab/terraform.tfstates"
    region         = "eu-west-1"
    dynamodb_table = "terraform-lock"
  }
}