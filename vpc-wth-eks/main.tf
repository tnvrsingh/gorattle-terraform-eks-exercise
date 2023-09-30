provider "aws" {
  region = "ap-south-1"
}
module "vpc" {
  source = "./vpc"
}

module "eks_cluster" {
  source = "./eks-cluster"

  private_subnet_ids = module.vpc.private_subnet_ids
}