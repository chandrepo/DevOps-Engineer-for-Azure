variable "prefix" {
  description = "The prefix which should be used for all resources in this example"
  default = "webserver"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  default = "eastus"
}

variable "instance_count" {
  description = "The count to increase the number of virtual machines behined the load balancer(not more than five)."
  default = 4
}
