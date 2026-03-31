##############################################################################
# Variables File
#
# Here is where we store the default values for all the variables used in our
# Terraform code. If you create a variable with no default, the user will be
# prompted to enter it (or define it via config file or command line flags.)

variable "prefix" {
  description = "This prefix will be included in the name of most resources."
}

variable "region" {
  description = "The region where the resources are created."
  default     = "ap-southeast-1"
}

variable "address_space" {
  description = "The address space that is used by the virtual network. You can supply more than one address space. Changing this forces a new resource to be created."
  default     = "10.0.0.0/16"
}

variable "subnet_prefix" {
  description = "The address prefix to use for the subnet."
  default     = "10.0.10.0/24"
}

variable "instance_type" {
  description = "Specifies the AWS instance type."
  default     = "t3.micro"
  validation {
    condition     = contains(["t3.micro", "t3.xlarge", "t3.2xlarge"], var.instance_type)
    error_message = "Instance type must be one of t3.micro, t3.xlarge, or t3.2xlarge."
  }
}

variable "admin_username" {
  description = "Administrator user name for mysql"
  default     = "hashicorp"
}

variable "height" {
  default     = "800"
  description = "Image height in pixels."
}

variable "width" {
  default     = "1200"
  description = "Image width in pixels."
}

variable "placeholder" {
  default     = "placecats.com"
  description = "Image-as-a-service URL. Some other fun ones to try are fillmurray.com, placecage.com, placebeard.it, loremflickr.com, baconmockup.com, placeimg.com, placebear.com, placeskull.com, stevensegallery.com, placedog.net"
    validation {
    condition     = contains(["placecats.com", "placebear.com", "https://placedog.net/"], var.placeholder)
    error_message = "Placeholder must be one of placecats.com, placebear.com, or https://placedog.net/."
  }
}

variable "number_of_instances" {
  default     = 1
  description = "Number of instances to create."
  validation {
    condition     = var.number_of_instances > 0 && var.number_of_instances <= 2
    error_message = "Number of instances must be between 1 and 2."
  }
}