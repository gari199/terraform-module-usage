provider "aws" {
  region = "eu-central-1"
}

#RDS MySql Example
module "rds-mysql" {
  source                 = "app.terraform.io/ACME_Organization/rds-mysql/aws"
  version                = "1.0.0"
  account_id             = "637423344778"
  allocated_storage      = "20"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  db_name                = "mysqldb"
  username               = "admin"
  parameter_group_name   = "default.mysql8.0"
  vpc_security_group_ids = ["sg-0c226fddab0a2860c"]
  kms_key_alias          = "mysql-key"
}

#VPC exmaple
module "vpc" {
  source                       = "app.terraform.io/ACME_Organization/vpc/aws"
  version                      = "1.0.0"
  region                       = "eu-central-1"
  project_name                 = "module-project"
  vpc_cidr                     = "10.0.0.0/16"
  public_subnet_az1_cidr       = "10.0.0.0/24"
  public_subnet_az2_cidr       = "10.0.1.0/24"
  private_app_subnet_az1_cidr  = "10.0.2.0/24"
  private_app_subnet_az2_cidr  = "10.0.3.0/24"
  private_data_subnet_az1_cidr = "10.0.4.0/24"
  private_data_subnet_az2_cidr = "10.0.5.0/24"
}

