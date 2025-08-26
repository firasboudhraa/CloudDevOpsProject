module "network" {
  source = "./Modules/Network"

  project_name         = var.project_name
  location             = var.location
  vnet_cidr            = "10.0.0.0/16"
  public_subnet_cidr   = "10.0.1.0/24"
  private_subnet_cidr  = "10.0.10.0/24"
}

module "compute" {
  source = "./Modules/Compute"

  project_name         = var.project_name
  location             = var.location
  resource_group_name  = module.network.resource_group_name
  subnet_id            = module.network.public_subnet_id
  admin_username       = var.admin_username
  admin_password       = var.admin_password
  vm_size              = var.vm_size
}
