module "vpc" {
  source        = "./modules/network"
  
  project_name  = var.project_name
  aws_region    = var.aws_region
}