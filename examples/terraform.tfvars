# General
aws_region  = "ap-southeast-1"
aws_account = "623552185285" # AWS account where resource will be created
aws_role    = "OrganizationAccountAccessRole"

# Tagging
namespace       = "bbsdm"
bounded_context = "shared"
environment     = "production"

# Network - General
subnet_count         = "2"
aws_eks_cluster_name = "bbsdm-shared-eks"

# VPC
aws_vpc_name = "bbsdm-shared-vpc"
aws_vpc_cidr = "10.0.0.0/16"

# Internet Gateway
aws_internet_gateway_name = "bbsdm-shared-internet-gateway"

# Route Tables
aws_route_table_gateway_name     = "bbsdm-shared-gateway-route-table"
aws_route_table_application_name = "bbsdm-shared-application-route-table"
aws_route_table_database_name    = "bbsdm-shared-database-route-table"

# NAT Gateway
aws_eip_name         = "bbsdm-shared-nat-gateway-eip"
aws_nat_gateway_name = "bbsdm-shared-nat-gateway"

# NAT Instance
aws_security_group_name    = "bbsdm-shared-nat-instance-sg"
aws_nat_instance_name      = "bbsdm-shared-nat-instance"
aws_instance_ami           = "ami-0003ce8d47722ef67" # Search for the latest AMI ID using text: amzn-ami-vpc-nat
aws_instance_instance_type = "t3.nano"

# Subnets
aws_subnet_gateway_name     = "bbsdm-shared-gateway-subnet"
aws_subnet_application_name = "bbsdm-shared-application-subnet"
aws_subnet_database_name    = "bbsdm-shared-database-subnet"

# VPC Endpoints
aws_vpc_endpoint_dynamodb_name = "bbsdm-shared-vpce-dynamodb"
aws_vpc_endpoint_s3_name       = "bbsdm-shared-vpce-s3" 