# Azure Infrastructure Operations Project: Deploying a scalable IaaS web server in Azure

### Introduction
  In this project for  writing a Packer template and a Terraform template to deploy a customizable, scalable web server in Azure.

### Getting Started

#### Create and Apply a Tagging Policy

  Creating a policy that ensures all indexed resources in the subscription have tags and deny deployment if they do not.

	1. Writing the policy definition to deny the creation of resources that do not have the tags.
	2. Applying the policy definition to the subscription with name of the tagging-policy.
	3. Using the command  "az policy assignment list"  to list policy assignments  and taking a screenshot of the policy assignments list.
	
#### Creating the Server Image

  The first thing is to create the server image using packer, ensuring that the same "Hello World" application page is included in the packer template.

	1. Using the  Ubuntu 18.04 LTS image to create the base image.
	2. Ensuring the resources group specified in packer for the image is the same image specified in the terraform.


#### Creating the Infrastructure
 
  Following are the main steps followed to create the infrastructure for the application with required runtime environment.

	1. Creating the Resource Group.
	2. Creating the virtual network and a subnet on that virtual network.
	3. Creating the network security group and ensuring that the explicit access to other VMs on the subnet and deny the direct access from the internet. 
	4. Creating the network interface.
	5. Creating the public IP.
	6. Creating the Load Balancer with Backend pool, health probe, load balancer rule.
	7. Creating the Availability Set.
	8. Creating the Virtual machines with image created by the packer.
	9. Creating the managed disks for the Virtual machines.
	10. prefix, location and instance_count are the configurable parameters.
	

### Dependencies

	1. Create an [Azure Account](https://portal.azure.com) 
	2. Install the [Azure command line interface](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
	3. Install [Packer](https://www.packer.io/downloads)
	4. Install [Terraform](https://www.terraform.io/downloads.html)


### Instructions

Following are the commands used for packer and terraform

#### Packer

  Run the below command for Build the VM image
	
	1.  packer build server.json 

#### Terraform

  Run the below commands for deploying the Infrastructure

	1. Run terraform init to get started.
	2. Run terraform plan -var-file=variables.tfvars -lock=false to view the resources they will be created.
	3. Run terraform plan -var-file=variables.tfvars -lock=false -out solution.plan to save the plan that the resources will be created.
	4. Run terraform apply -var-file=variables.tfvars -lock=false or terraform apply solution.plan to apply the plan and deploy the infrastructure.
	5. Run terraform destroy -var-file=variables.tfvars -lock=false to delete the infrastructure.

### Output

  Following are the example output values after deploying the infrastructure with terraform.

  Outputs:

  Output_Values = [
    
    "Public IP Address :   20.185.37.191 ",
    
    "Packer Image ID :   /subscriptions/9761a7ff-23aa-4bfa-a301-9206bfa2a9ce/resourceGroups/PackerResourceGroup/providers/Microsoft.Compute/images/MyNginxImage",
  
  ]





