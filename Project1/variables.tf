variable "prefix" {
  description = "The prefix which should be used for all resources in this example"
  default = "webserver"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  default = "eastus2"
}

variable "instance_count" {
  description = "The count to increase the number of virtual machines behined the load balancer(not more than five)."
  default = 2
}

variable "image_id" {
  description = "The image id built by packer to deploy the virtual machines."
  default = "/subscriptions/9761a7ff-23aa-4bfa-a301-9206bfa2a9ce/resourceGroups/PackerResourceGroup/providers/Microsoft.Compute/images/MyNginxImage" 
}
