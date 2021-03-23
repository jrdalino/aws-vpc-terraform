module "vpc" {
  source = "git::https://github.com/jrdalino/aws-vpc-terraform.git?ref=main"
  # General
  aws_region              = var.aws_region
  aws_account             = var.aws_account
  aws_role                = var.aws_role

  # Tagging
  namespace               = var.namespace
  bounded_context         = var.bounded_context
  environment             = var.environment

  # Network - General
  subnet_count            = var.subnet_count
  aws_eks_cluster_name    = var.aws_eks_cluster_name

  # VPC
  aws_vpc_name = var.aws_vpc_name
  aws_vpc_cidr = var.aws_vpc_cidr

  # Internet Gateway
  aws_internet_gateway_name = var.aws_internet_gateway_name

  # Route Tables
  aws_route_table_gateway_name     = var.aws_route_table_gateway_name
  aws_route_table_application_name = var.aws_route_table_application_name
  aws_route_table_database_name    = var.aws_route_table_database_name

  # NAT Gateway
  aws_eip_name         = var.aws_eip_name
  aws_nat_gateway_name = var.aws_nat_gateway_name

  # NAT Instance
  aws_security_group_name    = var.aws_security_group_name
  aws_nat_instance_name      = var.aws_nat_instance_name
  aws_instance_ami           = var.aws_instance_ami
  aws_instance_instance_type = var.aws_instance_instance_type

  # Subnets
  aws_subnet_gateway_name     = var.aws_subnet_gateway_name
  aws_subnet_application_name = var.aws_subnet_application_name
  aws_subnet_database_name    = var.aws_subnet_database_name

  # VPC Endpoints
  aws_vpc_endpoint_dynamodb_name = var.aws_vpc_endpoint_dynamodb_name
  aws_vpc_endpoint_s3_name       = var.aws_vpc_endpoint_s3_name
}