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
data "aws_secretsmanager_secret" "mysqldb_pw" {
  name = "mmysqldb_pw"
}

data "aws_secretsmanager_secret_version" "mysqldb_pw" {
  secret_id = data.aws_secretsmanager_secret.mysqldb_pw.id
}