

# Create RDC Mysql Database


resource "aws_db_instance" "db1" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "root"
  password             = "redhat123"
  parameter_group_name = "default.mysql5.7"
  publicly_accessible = true
  skip_final_snapshot  = true
#   sensitive=true
}


output "I1"  {
value = "Endpoint : ${aws_db_instance.db1.endpoint}"
}

output "I2" {
value = "Username : ${aws_db_instance.db1.username}"
}
output "I3" {
value = "Port : ${aws_db_instance.db1.port}"
}
output "I4" {
value = "Database Identifier : ${aws_db_instance.db1.name}"
}


# output "I2" {
# value = aws_db_instance.db1.password
# }

# output "out" {
#     value = aws_db_instance.default
#     sensitive = true

# }