module "vpc" {
  source = "../vpc"
}

module "eks_cluster" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name = "gorattle-cluster"
  vpc_id = module.vpc.vpc_id
  subnet_ids = concat(module.vpc.private_subnet_ids, module.vpc.public_subnet_ids)
}


provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "my-context"
}
resource "kubernetes_namespace" "exercise" {
  metadata {
    name = "exercise"
  }
}

output "eks_cluster_endpoint" {
  value = module.eks_cluster.cluster_endpoint
}

resource "kubernetes_deployment" "exercise" {
  metadata {
    name = "exercise"
    namespace = kubernetes_namespace.exercise.id
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "exercise"
      }
    }

    template {
      metadata {
        labels = {
          app = "exercise"
        }
      }

      spec {
        container {
          name  = "exercise-container"
          image = "tanvirsingh/gorattle-experiment:v1.0"
        }
      }
    }
  }
}

resource "kubernetes_service" "exercise" {
  metadata {
    name = "exercise-service"
  }

  spec {
    selector = {
      app = kubernetes_deployment.exercise.metadata[0].name
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer" 
  }
}

output "ingress_attributes" {
  value = [for service in kubernetes_service.exercise : service.ingress]
}
