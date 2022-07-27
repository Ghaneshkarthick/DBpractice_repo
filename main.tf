resource "aws_db_subnet_group" "Data_subg" {
  name       = "db_subnet_grp"
  subnet_ids = [data.aws_subnet.private.id, data.aws_subnet.data.id]

  tags = {
    Name = "My DB subnet group"
  }
}


resource "aws_db_instance" "Dbpractice" {
  allocated_storage    = 20
  storage_type         = "gp2" 
  engine               = "Mysql"
  engine_version       = "8.0"
  multi_az             = true
  instance_class       = "db.t3.micro"
  vpc_security_group_ids =[aws_security_group.db-sg.id]
  db_subnet_group_name = aws_db_subnet_group.Data_subg.name
  db_name              = "Animedb"
  username             = "Luffy"
  password             = "Mughiwara123"
  backup_retention_period = 1
  skip_final_snapshot  = true
}

resource "aws_subnet" "data-a" {
  vpc_id     = aws_vpc.lab_vpc.id
  cidr_block = var.cidr_data

  tags = {
    Name = "Data-a_Subnet"
  }
}
