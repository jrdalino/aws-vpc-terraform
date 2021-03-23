# General
variable "aws_region" {
  type        = string
  description = "Used AWS Region."
}

variable "aws_account" {
  type        = string
  description = "Used AWS Account."
}

variable "aws_role" {
  type        = string
  description = "Used AWS Role."
}

# Tagging
variable "namespace" {
  type        = string
  description = "Namespace."
}

variable "bounded_context" {
  type        = string
  description = "Bounded Context."
}

variable "environment" {
  type        = string
  description = "Environment."
}

# Network - General
variable "subnet_count" {
  type        = string
  description = "The number of subnets we want to create per type to ensure high availability."
}

variable "aws_eks_cluster_name" {
  type        = string
  description = "The name of the EKS Cluster if any"
}

# VPC
variable "aws_vpc_name" {
  type        = string
  description = "VPC Name"
}

variable "aws_vpc_cidr" {
  type        = string
  description = "CIDR for VPC."
}

# Internet Gateway
variable "aws_internet_gateway_name" {
  type        = string
  description = "Internet Gateway Name"
}

# Route Tables
variable "aws_route_table_gateway_name" {
  type        = string
  description = "Gateway Route Table Name"
}

variable "aws_route_table_application_name" {
  type        = string
  description = "Application Route Table Name"
}

variable "aws_route_table_database_name" {
  type        = string
  description = "Database Route Table Name"
}

# NAT Gateway
variable "aws_eip_name" {
  type        = string
  description = "NAT Gateway Elastic IP"
}

variable "aws_nat_gateway_name" {
  type        = string
  description = "NAT Gateway Name"
}

# NAT Instance
variable "aws_security_group_name" {
  type        = string
  description = "NAT Instance Security Group"
}

variable "aws_nat_instance_name" {
  type        = string
  description = "NAT Instance Name"
}

variable "aws_instance_ami" {
  type        = string
  description = "NAT Instance AMI"
}

variable "aws_instance_instance_type" {
  type        = string
  description = "NAT Instance Type"
}

# Subnets
variable "aws_subnet_gateway_name" {
  type        = string
  description = "Gateway Subnet Name"
}

variable "aws_subnet_application_name" {
  type        = string
  description = "Applicatioon Subnet Name"
}

variable "aws_subnet_database_name" {
  type        = string
  description = "Database Subnet Name"
}

# VPC Endpoints
variable "aws_vpc_endpoint_dynamodb_name" {
  type        = string
  description = "DynamoDB VPC Endpoint Name"
}

variable "aws_vpc_endpoint_s3_name" {
  type        = string
  description = "S3 VPC Endpoint Name"
}