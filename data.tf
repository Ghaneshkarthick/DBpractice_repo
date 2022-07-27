data "aws_vpc" "db_vpc" {
    filter {
    name   = "tag:Name"
    values = ["lab_vpc"]
  }
}
data "aws_subnet" "private" {
    filter {
    name   = "tag:Name"
    values = ["Private_Subnet"]
  }
}
data "aws_subnet" "data" {
    filter {
    name   = "tag:Name"
    values = ["Data_Subnet"]
  }
}
# data "github_actions_public_key" "credentials" {
#   repository = "DBpractice_repo"
# }

# resource "github_actions_secret" "username" {
#   repository       = "DBpractice_repo"
#   secret_name      = "USERNAME"
  
# }

# resource "github_actions_secret" "password" {
#   repository       = "DBpractice_repo"
#   secret_name      = "PASSWORD"
# }