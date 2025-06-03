variable "image_name" {
  description = "Name of the local Docker image"
  type        = string
  default     = "task-3-image"
}

variable "container_name" {
  description = "Name of Docker container"
  type        = string
  default     = "custom-nginx-container"
}

variable "internal_port" {
  description = "Port inside the container"
  type        = number
  default     = 80
}

variable "external_port" {
  description = "Port on host machine"
  type        = number
  default     = 8000
}