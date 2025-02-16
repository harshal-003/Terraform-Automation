terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"  # Use the latest version
    }
  }
}


data "docker_image" "local_image" {
  name = "flask-app"
}


resource "docker_container" "flask-app" {

  name  = "flask-app"

  image = data.docker_image.local_image.name


}
resource "null_resource" "wait_for_container" {

  depends_on = [docker_container.flask-app]


}
