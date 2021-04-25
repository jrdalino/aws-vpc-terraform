data "aws_availability_zones" "available" {
}

# VPC
resource "aws_vpc" "this" {
  cidr_block = var.aws_vpc_cidr
  # instance_tenancy = default
  enable_dns_support   = true
  enable_dns_hostnames = true
  # enable_classiclink = false
  # enable_classiclink_dns_support = false
  # assign_generated_ipv6_cidr_block = false

  # Tagging
  tags = {
    Name                                                = var.aws_vpc_name
    Namespace                                           = var.namespace
    BoundedContext                                      = var.bounded_context
    Environment                                         = var.environment
    "kubernetes.io/cluster/${var.aws_eks_cluster_name}" = "shared"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  # Tagging
  tags = {
    Name           = var.aws_internet_gateway_name
    Namespace      = var.namespace
    BoundedContext = var.bounded_context
    Environment    = var.environment
  }
}

# Route Table - Gateway
resource "aws_route_table" "gateway" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    # ipv6_cidr_block
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name           = var.aws_route_table_gateway_name
    Namespace      = var.namespace
    BoundedContext = var.bounded_context
    Environment    = var.environment
    Network        = "public"
  }

  # propagating_vgws
}

# Route Table - Application
resource "aws_route_table" "application" {
  count  = var.subnet_count
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    # ipv6_cidr_block
    instance_id = aws_instance.this.*.id[count.index] # Use this if using NAT Instance    
    # nat_gateway_id = aws_nat_gateway.this.*.id[count.index] # Use this if using NAT Gateway
  }

  tags = {
    Name           = var.aws_route_table_application_name
    Namespace      = var.namespace
    BoundedContext = var.bounded_context
    Environment    = var.environment
    Network        = "private"
  }

  # propagating_vgws  
}

# Route Table - Database
resource "aws_route_table" "database" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name           = var.aws_route_table_database_name
    Namespace      = var.namespace
    BoundedContext = var.bounded_context
    Environment    = var.environment
    Network        = "private"
  }

  # propagating_vgws    
}

# Elastic IP # Uncomment this if using NAT Gateway
# resource "aws_eip" "nat_gateway" {
#   count = var.subnet_count
#   vpc   = true

#   tags = {
#     Name = var.aws_eip_name
#     Namespace      = var.namespace
#     BoundedContext = var.bounded_context
#     Environment    = var.environment
#   }  
# }

# NAT Gateway # Uncomment this if using NAT Gateway
# resource "aws_nat_gateway" "this" {
#   count         = var.subnet_count
#   allocation_id = aws_eip.nat_gateway.*.id[count.index]
#   subnet_id     = aws_subnet.gateway.*.id[count.index]

#   tags = {
#     Name = var.aws_nat_gateway_name
#     Namespace      = var.namespace
#     BoundedContext = var.bounded_context
#     Environment    = var.environment
#   }

#   depends_on = [aws_internet_gateway.this]
# }

# Security Group # Uncomment this if using NAT Instance
resource "aws_security_group" "this" {
  name = var.aws_security_group_name
  # name_prefix
  description = "NAT Instance Security Group"

  ingress {
    description = "Allow inbound HTTPS traffic from servers in the private subnet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow outbound HTTP access to the Internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # revoke_rules_on_delete = false

  vpc_id = aws_vpc.this.id

  # Tagging
  tags = {
    Name           = var.aws_security_group_name
    Namespace      = var.namespace
    BoundedContext = var.bounded_context
    Environment    = var.environment
  }
}

# NAT Instance # Uncomment this if using NAT Instance
resource "aws_instance" "this" {
  count                       = var.subnet_count
  ami                         = var.aws_instance_ami
  instance_type               = var.aws_instance_instance_type
  vpc_security_group_ids      = [aws_security_group.this.id]
  subnet_id                   = aws_subnet.gateway.*.id[count.index]
  associate_public_ip_address = true
  source_dest_check           = false

  # Tagging
  tags = {
    Name           = var.aws_nat_instance_name
    Namespace      = var.namespace
    BoundedContext = var.bounded_context
    Environment    = var.environment
  }

  depends_on = [aws_internet_gateway.this]
}

# Subnet - Gateway
resource "aws_subnet" "gateway" {
  count             = var.subnet_count
  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = "10.0.1${count.index}.0/24"
  vpc_id            = aws_vpc.this.id

  tags = {
    Name                                                = var.aws_subnet_gateway_name
    Namespace                                           = var.namespace
    BoundedContext                                      = var.bounded_context
    Environment                                         = var.environment
    "kubernetes.io/role/elb"                            = "1"
    "kubernetes.io/cluster/${var.aws_eks_cluster_name}" = "shared"
  }
}

# Subnet - Application
resource "aws_subnet" "application" {
  count             = var.subnet_count
  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = "10.0.2${count.index}.0/24"
  vpc_id            = aws_vpc.this.id

  tags = {
    Name                                                = var.aws_subnet_application_name
    Namespace                                           = var.namespace
    BoundedContext                                      = var.bounded_context
    Environment                                         = var.environment
    "kubernetes.io/cluster/${var.aws_eks_cluster_name}" = "shared"
  }
}

# Subnet - Database
resource "aws_subnet" "database" {
  count             = var.subnet_count
  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = "10.0.3${count.index}.0/24"
  vpc_id            = aws_vpc.this.id

  tags = {
    Name           = var.aws_subnet_database_name
    Namespace      = var.namespace
    BoundedContext = var.bounded_context
    Environment    = var.environment
  }
}

# Route Table Association - Gateway
resource "aws_route_table_association" "gateway" {
  count          = var.subnet_count
  subnet_id      = aws_subnet.gateway.*.id[count.index]
  route_table_id = aws_route_table.gateway.id
}

# Route Table Association - Application
resource "aws_route_table_association" "application" {
  count          = var.subnet_count
  subnet_id      = aws_subnet.application.*.id[count.index]
  route_table_id = aws_route_table.application.*.id[count.index]
}

# Route Table Association - Database
resource "aws_route_table_association" "database" {
  count          = var.subnet_count
  subnet_id      = aws_subnet.database.*.id[count.index]
  route_table_id = aws_route_table.database.id
}

# VPC Endpoint
resource "aws_vpc_endpoint" "dynamodb" {
  service_name = "com.amazonaws.${var.aws_region}.dynamodb"
  vpc_id       = aws_vpc.this.id
  # auto_accept
  # policy
  # private_dns_enabled = false # Applicable for endpoints of type Interface
  route_table_ids = [aws_route_table.gateway.*.id[count.index], aws_route_table.application.*.id[count.index], aws_route_table.database.*.id[count.index]]
  # subnet_ids # Applicable for endpoints of type GatewayLoadBalancer and Interface.
  tags = {
    Name           = var.aws_vpc_endpoint_dynamodb_name
    Namespace      = var.namespace
    BoundedContext = var.bounded_context
    Environment    = var.environment
  }
  vpc_endpoint_type = "Gateway" # GatewayLoadBalancer, or Interface
}

resource "aws_vpc_endpoint" "s3" {
  service_name = "com.amazonaws.${var.aws_region}.s3"
  vpc_id       = aws_vpc.this.id
  # auto_accept
  # policy
  # private_dns_enabled = false # Applicable for endpoints of type Interface
  route_table_ids = [aws_route_table.gateway.*.id[count.index], aws_route_table.application.*.id[count.index], aws_route_table.database.*.id[count.index]]
  # subnet_ids # Applicable for endpoints of type GatewayLoadBalancer and Interface.
  tags = {
    Name           = var.aws_vpc_endpoint_s3_name
    Namespace      = var.namespace
    BoundedContext = var.bounded_context
    Environment    = var.environment
  }
  vpc_endpoint_type = "Gateway" # GatewayLoadBalancer, or Interface
}