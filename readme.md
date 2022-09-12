## Install

[Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli#install-terraform) following the offical instructions

[Install HashiCorp Terraform VSCode Instructions](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform)

I will mostly be using AWS as the primary provider. 

## Getting Started

- Creating main.tf
- Add AWS Provider
- Generate and configure AWS credentials
- Configure an AWS Virtual Machine
- Initialize terraform project
- Terraform fmt
- Terraform validate
- Terraform plan
- Terraform apply
- Terraform apply (updateing)
- Create Input Variables
- Set Locals
- Create Outputs
- Use a Terraform Module
- Divide project into multiple files
- Terraform destroy
- Create a Terraform Cloud workspace
- Migrate local to remote workspace
- Move AWS Credentials to Env Vars

## Provisioners

- Cloud-Init
- Local Exec
- Remote Exec
- File
- Connection
- Null Resource and Trigger

## Providers

- Provision AWS Resource
- Provision Azure Resource
- Provision GCP Resource

- Provision Spotify Playlist
- Provision Minecraft Server

## Variables and Outputs

- terraform.tfvars
- additional variable files and -var-file
- additional autoloaded files
- -var
- TF_VAR_
- Ouputs CLI
- Chaining outputs from a module
- Local values
- Data Sources

## Resource Meta Arguements

- depends_on
- count
- for_each
- provider and alias
- lifecycle

## Expressions

- String Templates
- For Expressions
- Splats
- Dynamic Blocks
- Versions Constraints

## Terraform State
- terraform state list
- terraform state mv
- terraform state show
- terraform state mv

## Plan and Apply

- Speculative Plans
- Saved Plans

## Manage Resource Drift

- Replace
- Import
- Refresh

## Troubleshooting

- Terraform Log
- Terraform Crash log

## Modules

- Create a module
- Publish a module

## Backends

- Standard Backend with Amazon S3
- Remote backend multiple workspaces
- terraform_remote_state local
- terraform_remote_state remote
- force-unlock