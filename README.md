# Terraform module to provision an AWS VPC with Public and Private Subnets

## This creates the following resources:
- VPC
- Internet Gateway
- Route Table: Gateway
- Route Table: Application
- Route Table: Database
- NAT Gateway or NAT Instance
- Elastic IP
- Subnet: Gateway
- Subnet: Application
- Subnet: Database
- Route Table Association: Gateway
- Route Table Association: Application
- Route Table Association: Database
- VPC Endpoint for DynamoDB
- VPC Endpoint for S3

## Architecture Diagram: https://www.draw.io/#G1I1q3XWw3KAdFl1bfwG3AbW_tR6GKMXsB
![Image description](https://github.com/jrdalino/aws-vpc-terraform/blob/main/images/aws_vpc_architecture_diagram.png)

## Prerequisites
- Provision an S3 bucket to store Terraform State and DynamoDB for state-lock using https://github.com/jrdalino/aws-tfstate-backend-terraform
- AssumeRole: "OrganizationAccountAccessRole" should exist in the destination AWS account

## Terraform Module Usage
- Copy the contents of /examples folder (main.tf, ouputs.tf, state_config.tf, terraform.tfvars and variabels.tf)
- Include this repository as a module in your existing terraform code:
```
module "vpc" {
  source = "git::https://github.com/jrdalino/aws-vpc-terraform.git?ref=main"
}
```
- Replace variables in state_config.tf
- Replace variables in terraform.tfvars
- Initialize, Review Plan and Apply
```
$ terraform init
$ terraform fmt
$ terraform validate
$ terraform plan
$ terraform apply
```

## Inputs
| Name | Description |
|------|-------------|
| | |

## Outputs
| Name | Description |
|------|-------------|
| | |

## References
- https://learn.hashicorp.com/terraform/aws/eks-intro
- https://github.com/terraform-providers/terraform-provider-aws/tree/master/examples/eks-getting-started
