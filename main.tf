terraform {
  backend "local" {}
}

module "naming-resources" {
  source = "./modules/naming-resources"
}

output "resource_name" {
  value = module.naming-resources.resource_name
}