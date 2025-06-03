# Create Docker Container
resource "docker_container" "my_container" {
  image = var.image_name
  name  = var.container_name
  ports {
    internal = var.internal_port
    external = var.external_port
  }
}

