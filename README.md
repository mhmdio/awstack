# Best Practices AWS Ops without HC Atlas

## Getting Started

This repository contains best-practices infrastructure for AWS  with different, regions, environments, and operating systems.

This will use Terraform, Packer, Consul and Vault that allow you to provision unique AWS infrastructures.
This project will deploy an end to end infrastructure in AWS that includes the below resources in us-east-1:

- VPC CIDR = 10.30.0.0/16
- AZs = us-east-1a,us-east-1c,us-east-1e
- Public subnets = 10.30.11.0/24,10.30.12.0/24,10.30.13.0/24
- Private subnets = 10.30.1.0/24,10.30.2.0/24,10.30.3.0/24
- two S3 buckets prod_bucket and dev_bucket
- S3 read-only policy and S3 read-write policy
- Google Apps emails access for IAM users
- NAT
- OpenVPN
- Bastion host
- 3 nodes Consul cluster
- 2 nodes Vault HA with Consul backend

## Testing
You can easily validate packer templates, and test terraform plans by running ./setup/aws-staging/test_staging.sh

## How to run
- add AWS credentials to set_vars.sh and run it
- generate Certs and Keys using gen_cert.sh and gen_key.sh
- (optional) run vagrant.sh test packer templates
- run packer.sh to generate AMIs and save them to amis.txt
- run terraform.sh to deploy AWS infrastructure

## Vagrant
You can use vagrant to test packer templates with Virtualbox before generating the AWS AMIs, this allow you to test the whole infrastructure with vagrant before deploying.

## ISO Distributions
packer templates and vagrant boxes is tested with ubuntu-14.04.5, you can add other versions and distribution in the ISO folder, and update the checksum value in the template file
