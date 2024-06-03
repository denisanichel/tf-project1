variable "base_name" {
  description = "Base name"
  type = string
  default = "ec2-03098348-gdjhaGlldfhkaFDD"
}

variable "resource_type" {
  description = "Resource type"
  type = string
  validation {
    condition     = contains(["virtual_machine", "key_vault", "storage_account"], var.resource_type)
    error_message = "Valid values for resource_type are: virtual_machine, key_vault, storage_account"
  }
  default = "virtual_machine"
}