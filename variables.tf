variable "location" {
  description = "Azure region where all resources will be deployed"
  type        = string
  default     = "East US"
}

variable "team_name" {
  description = "Team name to identify resources (Fatima, Tasneem, Sara)"
  type        = string
  default     = "FatimaTasneemSara"
}

variable "vm_size" {
  description = "Size of the VM (Standard_B1s is free tier eligible)"
  type        = string
  default     = "Standard_B1s"
}

variable "docker_image" {
  description = "Docker Hub image name from Tasneem's container"
  type        = string
  default     = "nginx:latest"
}