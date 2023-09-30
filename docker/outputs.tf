locals {
  docker_image = "${var.dockerhub_username}/${var.docker_image_repo}:${var.docker_image_tag}"
}

output "docker_image" {
  value = local.docker_image
}