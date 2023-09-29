# variables
variable "docker_image_name" {
  description = "The name of the Docker image"
  type        = string
}

variable "docker_image_tag" {
  description = "The tag of the Docker image"
  type        = string
}

variable "dockerhub_username" {
  description = "Docker Hub username"
  type        = string
}

variable "dockerhub_password" {
  description = "Docker Hub password"
  type        = string
}

variable "docker_image_repo" {
  description = "Docker image repository name"
  type        = string
}

variable "docker_image_tag" {
  description = "Docker image tag"
}
