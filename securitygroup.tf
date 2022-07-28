resource "aws_security_group" "db-sg" {
  name = "rds-sg"

  description = "RDS (terraform-managed)"
  vpc_id      = data.aws_vpc.db_vpc.id

  # Only MySQL in
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["192.168.1.0/24"]
  }

  # Allow all outbound traffic.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Open port 3306"
  }
}