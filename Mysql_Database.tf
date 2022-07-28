resource "aws_db_subnet_group" "Data_subg" {
  name       = "db_subnet_grp"
  subnet_ids = [data.aws_subnet.private.id, data.aws_subnet.data.id]

  tags = {
    Name = "My DB subnet group"
  }
}


resource "aws_db_instance" "Dbpractice" {
  allocated_storage    = var.allocated_storage
  storage_type         = var.storage_type
  engine               = var.engine
  engine_version       = var.engine_version
  multi_az             = true
  instance_class       = var.instance_class
  vpc_security_group_ids =[aws_security_group.db-sg.id]
  db_subnet_group_name = aws_db_subnet_group.Data_subg.name
  db_name              = var.db_name
  username             = "Luffy"
  password             = "Mughiwara123"
  backup_retention_period =var.backup_retention_period
  skip_final_snapshot  = true
}