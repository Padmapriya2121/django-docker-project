terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "npipe:////./pipe/docker_engine"
}

resource "docker_image" "django" {
  name = "django-docker-project:latest"

  build {
    context    = "."
    dockerfile = "Dockerfile"
  }
}

resource "docker_container" "django" {
  name  = "terraform-django-container"
  image = docker_image.django.image_id

  ports {
    internal = 8000
    external = 8001
  }
}