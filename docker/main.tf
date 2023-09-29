data "docker_image" "rattle_image" {
  name = "${var.docker_image_name}:${var.docker_image_tag}"
}

resource "null_resource" "push_image" {
  triggers = {
    image_id = data.docker_image.rattle_image.id
  }

  provisioner "local-exec" {
    command = "docker push ${var.docker_image_name}:${var.docker_image_tag}"
  }
}

