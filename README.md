# OciComputeAutomation
Scripts in Terraform and OCI CLI to create/delete instances in OCI
1. cli-create-instance.sh - Create Instance using OCI CLI
2. cli-destroy-instance.sh - Remove Instance using OCI CLI
3. main.tf, gpu_instance.tf, data_source.tf, terraform.tfvars, variables.tf - Terraform configuration files and variable definitions
4. terraform.tfvars - Include your tenant, compute instance, network and authentication details
5. terraform-create-instance.sh, terraform-create-instance - Bash scripts which eventually can be used by crontab in Linux, to execute the terraform scripts and create log files.
