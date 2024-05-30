terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.20.0"
    }
  }
}


provider "aws" {
  region = "ap-south-1"

  assume_role {
    role_arn = "arn:aws:iam::471112548391:role/decimal-vrt-test"
  }
}

provider "kubernetes" {
#  version = "~> 2.0"

  // Kubernetes cluster configuration
  host                   = module.eks.eks_cluster_endpoint
}
