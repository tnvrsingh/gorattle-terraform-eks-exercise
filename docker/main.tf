resource "null_resource" "push_docker_image" {
  triggers = {
    dockerhub_username = var.dockerhub_username
    dockerhub_password = var.dockerhub_password
    docker_image_repo  = var.docker_image_repo
    docker_image_tag   = var.docker_image_tag
  }

  provisioner "local-exec" {
    command = "./build-and-deploy-image.sh"
    environment = {
      DOCKERHUB_USERNAME = var.dockerhub_username
      DOCKERHUB_PASSWORD = var.dockerhub_password
      DOCKERHUB_REPO     = var.docker_image_repo
      IMAGE_TAG          = var.docker_image_tag
    }
  }
}