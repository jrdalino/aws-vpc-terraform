# VPC
output "aws_vpc_arn" {
  value       = aws_vpc.this.arn
  description = "Amazon Resource Name (ARN) of VPC"
}

output "aws_vpc_id" {
  value       = aws_vpc.this.id
  description = "The ID of the VPC"
}

output "aws_vpc_cidr_block" {
  value       = aws_vpc.this.cidr_block
  description = "The CIDR block of the VPC"
}

output "aws_vpc_instance_tenancy" {
  value       = aws_vpc.this.instance_tenancy
  description = "Tenancy of instances spin up within VPC."
}

output "aws_vpc_enable_dns_support" {
  value       = aws_vpc.this.enable_dns_support
  description = "Whether or not the VPC has DNS support"
}

output "aws_vpc_enable_dns_hostnames" {
  value       = aws_vpc.this.enable_dns_hostnames
  description = "Whether or not the VPC has DNS hostname support"
}

output "aws_vpc_enable_classiclink" {
  value       = aws_vpc.this.enable_classiclink
  description = "Whether or not the VPC has Classiclink enabled"
}

output "aws_vpc_main_route_table_id" {
  value       = aws_vpc.this.main_route_table_id
  description = "The ID of the main route table associated with this VPC. Note that you can change a VPC's main route table by using an aws_main_route_table_association."
}

output "aws_vpc_default_network_acl_id" {
  value       = aws_vpc.this.default_network_acl_id
  description = "The ID of the network ACL created by default on VPC creation"
}

output "aws_vpc_default_security_group_id" {
  value       = aws_vpc.this.default_security_group_id
  description = "The ID of the security group created by default on VPC creation"
}

output "aws_vpc_default_route_table_id" {
  value       = aws_vpc.this.default_route_table_id
  description = "The ID of the route table created by default on VPC creation"
}

output "aws_vpc_ipv6_association_id" {
  value       = aws_vpc.this.ipv6_association_id
  description = "The association ID for the IPv6 CIDR block."
}

output "aws_vpc_ipv6_cidr_block" {
  value       = aws_vpc.this.ipv6_cidr_block
  description = "The IPv6 CIDR block."
}

output "aws_vpc_owner_id" {
  value       = aws_vpc.this.owner_id
  description = "The ID of the AWS account that owns the VPC."
}

output "aws_vpc_tags_all" {
  value       = aws_vpc.this.tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

# Internet Gateway
output "aws_internet_gateway_id" {
  value       = aws_internet_gateway.this.id
  description = "The ID of the Internet Gateway."
}

output "aws_internet_gateway_arn" {
  value       = aws_internet_gateway.this.arn
  description = "The ARN of the Internet Gateway."
}

output "aws_internet_gateway_owner_id" {
  value       = aws_internet_gateway.this.owner_id
  description = "The ID of the AWS account that owns the internet gateway."
}

# Route Tables - Gateway
output "aws_route_table_gateway_id" {
  value       = aws_route_table.gateway.id
  description = "The ID of the routing table."
}

output "aws_route_table_gateway_owner_id" {
  value       = aws_route_table.gateway.owner_id
  description = "The ID of the AWS account that owns the route table."
}

# Route Tables - Application
output "aws_route_table_application_id" {
  value       = aws_route_table.application.*.id
  description = "The ID of the routing table."
}

output "aws_route_table_application_owner_id" {
  value       = aws_route_table.application.*.owner_id
  description = "The ID of the AWS account that owns the route table."
}

# Route Tables - Database
output "aws_route_table_database_id" {
  value       = aws_route_table.database.id
  description = "The ID of the routing table."
}

output "aws_route_table_database_owner_id" {
  value       = aws_route_table.database.owner_id
  description = "The ID of the AWS account that owns the route table."
}

# Elastic IP
# NAT Gateways

# Security Groups
output "aws_security_group_id" {
  value       = aws_security_group.this.id
  description = "The ID of the security group"
}

output "aws_security_group_arn" {
  value       = aws_security_group.this.arn
  description = "The ARN of the security group"
}

output "aws_security_group_vpc_id" {
  value       = aws_security_group.this.vpc_id
  description = "The VPC ID."
}

output "aws_security_group_owner_id" {
  value       = aws_security_group.this.owner_id
  description = "The owner ID."
}

output "aws_security_group_name" {
  value       = aws_security_group.this.name
  description = "The name of the security group"
}

output "aws_security_group_description" {
  value       = aws_security_group.this.description
  description = "The description of the security group"
}

output "aws_security_group_ingress" {
  value       = aws_security_group.this.ingress
  description = "The ingress rules."
}

output "aws_security_group_egress" {
  value       = aws_security_group.this.egress
  description = "The ingress rules."
}

# NAT Instances
output "aws_instance_arn" {
  value       = aws_instance.this.*.arn
  description = "The ARN of the instance."
}

output "aws_instance_instance_state" {
  value       = aws_instance.this.*.instance_state
  description = "The state of the instance. One of: pending, running, shutting-down, terminated, stopping, stopped."
}

output "aws_instance_outpost_arn" {
  value       = aws_instance.this.*.outpost_arn
  description = "The ARN of the Outpost the instance is assigned to."
}

output "aws_instance_password_data" {
  value       = aws_instance.this.*.password_data
  description = "Base-64 encoded encrypted password data for the instance. Useful for getting the administrator password for instances running Microsoft Windows. This attribute is only exported if get_password_data is true. Note that this encrypted value will be stored in the state file, as with all exported attributes."
}

output "aws_instance_primary_network_interface_id" {
  value       = aws_instance.this.*.primary_network_interface_id
  description = "The ID of the instance's primary network interface."
}

output "aws_instance_private_dns" {
  value       = aws_instance.this.*.private_dns
  description = "The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC."
}

output "aws_instance_public_dns" {
  value       = aws_instance.this.*.public_dns
  description = "The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC."
}

output "aws_instance_public_ip" {
  value       = aws_instance.this.*.public_ip
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use public_ip as this field will change after the EIP is attached."
}

# Subnets - Gateway
output "aws_subnet_gateway_id" {
  value       = aws_subnet.gateway.*.id
  description = "The ID of the subnet"
}

output "aws_subnet_gateway_arn" {
  value       = aws_subnet.gateway.*.arn
  description = "The ARN of the subnet."
}

output "aws_subnet_gateway_ipv6_cidr_block_association_id" {
  value       = aws_subnet.gateway.*.ipv6_cidr_block_association_id
  description = "The association ID for the IPv6 CIDR block."
}

output "aws_subnet_gateway_owner_id" {
  value       = aws_subnet.gateway.*.owner_id
  description = "The ID of the AWS account that owns the subnet."
}

output "aws_subnet_gateway_tags_all" {
  value       = aws_subnet.gateway.*.tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

# Subnets - Application
output "aws_subnet_application_id" {
  value       = aws_subnet.application.*.id
  description = "The ID of the subnet"
}

output "aws_subnet_application_arn" {
  value       = aws_subnet.application.*.arn
  description = "The ARN of the subnet."
}

output "aws_subnet_application_ipv6_cidr_block_association_id" {
  value       = aws_subnet.application.*.ipv6_cidr_block_association_id
  description = "The association ID for the IPv6 CIDR block."
}

output "aws_subnet_application_owner_id" {
  value       = aws_subnet.application.*.owner_id
  description = "The ID of the AWS account that owns the subnet."
}

output "aws_subnet_application_tags_all" {
  value       = aws_subnet.application.*.tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

# Subnets - Database
output "aws_subnet_database_id" {
  value       = aws_subnet.database.*.id
  description = "The ID of the subnet"
}

output "aws_subnet_database_arn" {
  value       = aws_subnet.database.*.arn
  description = "The ARN of the subnet."
}

output "aws_subnet_database_ipv6_cidr_block_association_id" {
  value       = aws_subnet.database.*.ipv6_cidr_block_association_id
  description = "The association ID for the IPv6 CIDR block."
}

output "aws_subnet_database_owner_id" {
  value       = aws_subnet.database.*.owner_id
  description = "The ID of the AWS account that owns the subnet."
}

output "aws_subnet_database_tags_all" {
  value       = aws_subnet.database.*.tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

# Subnets (Concatenated)
output "app_gtwy_subnet_ids" {
  value = concat(aws_subnet.gateway.*.id, aws_subnet.application.*.id)
}

# Route Tables Association - Gateway
output "aws_route_table_association_gateway_id" {
  value       = aws_route_table_association.gateway.*.id
  description = "The ID of the association"
}

# Route Tables Association - Application
output "aws_route_table_association_application_id" {
  value       = aws_route_table_association.application.*.id
  description = "The ID of the association"
}

# Route Tables Association - Database
output "aws_route_table_association_database_id" {
  value       = aws_route_table_association.database.*.id
  description = "The ID of the association"
}

# VPC Endpoint - DynamoDB
output "aws_vpc_endpoint_dynamodb_id" {
  value       = aws_vpc_endpoint.dynamodb.id
  description = "The ID of the VPC endpoint."
}

output "aws_vpc_endpoint_dynamodb_arn" {
  value       = aws_vpc_endpoint.dynamodb.arn
  description = "The Amazon Resource Name (ARN) of the VPC endpoint."
}

output "aws_vpc_endpoint_dynamodb_cidr_blocks" {
  value       = aws_vpc_endpoint.dynamodb.cidr_blocks
  description = "The list of CIDR blocks for the exposed AWS service. Applicable for endpoints of type Gateway."
}

output "aws_vpc_endpoint_dynamodb_dns_entry" {
  value       = aws_vpc_endpoint.dynamodb.dns_entry
  description = "The DNS entries for the VPC Endpoint. Applicable for endpoints of type Interface. DNS blocks are documented below."
}

output "aws_vpc_endpoint_dynamodb_network_interface_ids" {
  value       = aws_vpc_endpoint.dynamodb.network_interface_ids
  description = "One or more network interfaces for the VPC Endpoint. Applicable for endpoints of type Interface."
}

output "aws_vpc_endpoint_dynamodb_owner_id" {
  value       = aws_vpc_endpoint.dynamodb.owner_id
  description = "The ID of the AWS account that owns the VPC endpoint."
}

output "aws_vpc_endpoint_dynamodb_prefix_list_id" {
  value       = aws_vpc_endpoint.dynamodb.prefix_list_id
  description = "The prefix list ID of the exposed AWS service. Applicable for endpoints of type Gateway."
}

output "aws_vpc_endpoint_dynamodb_requester_managed" {
  value       = aws_vpc_endpoint.dynamodb.requester_managed
  description = "Whether or not the VPC Endpoint is being managed by its service - true or false."
}

output "aws_vpc_endpoint_dynamodb_state" {
  value       = aws_vpc_endpoint.dynamodb.state
  description = "The state of the VPC endpoint."
}

# VPC Endpoint - S3
output "aws_vpc_endpoint_s3_id" {
  value       = aws_vpc_endpoint.dynamodb.id
  description = "The ID of the VPC endpoint."
}

output "aws_vpc_endpoint_s3_arn" {
  value       = aws_vpc_endpoint.dynamodb.arn
  description = "The Amazon Resource Name (ARN) of the VPC endpoint."
}

output "aws_vpc_endpoint_s3_cidr_blocks" {
  value       = aws_vpc_endpoint.dynamodb.cidr_blocks
  description = "The list of CIDR blocks for the exposed AWS service. Applicable for endpoints of type Gateway."
}

output "aws_vpc_endpoint_s3_dns_entry" {
  value       = aws_vpc_endpoint.dynamodb.dns_entry
  description = "The DNS entries for the VPC Endpoint. Applicable for endpoints of type Interface. DNS blocks are documented below."
}

output "aws_vpc_endpoint_s3_network_interface_ids" {
  value       = aws_vpc_endpoint.dynamodb.network_interface_ids
  description = "One or more network interfaces for the VPC Endpoint. Applicable for endpoints of type Interface."
}

output "aws_vpc_endpoint_s3_owner_id" {
  value       = aws_vpc_endpoint.dynamodb.owner_id
  description = "The ID of the AWS account that owns the VPC endpoint."
}

output "aws_vpc_endpoint_s3_prefix_list_id" {
  value       = aws_vpc_endpoint.dynamodb.prefix_list_id
  description = "The prefix list ID of the exposed AWS service. Applicable for endpoints of type Gateway."
}

output "aws_vpc_endpoint_s3_requester_managed" {
  value       = aws_vpc_endpoint.dynamodb.requester_managed
  description = "Whether or not the VPC Endpoint is being managed by its service - true or false."
}

output "aws_vpc_endpoint_s3_state" {
  value       = aws_vpc_endpoint.dynamodb.state
  description = "The state of the VPC endpoint."
}