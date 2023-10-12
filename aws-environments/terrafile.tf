module "network" {
  source = "./modules/network"

  project_name = var.project_name
  aws_region   = var.aws_region
}

module "eks_master" {
  source = "./modules/master"

  project_name    = var.project_name
  aws_region      = var.aws_region
  cluster_version = var.cluster_version

  cluster_vpc       = module.network.project_vpc
  private_subnet_1a = module.network.private_subnet_1a
  private_subnet_1b = module.network.private_subnet_1b
}