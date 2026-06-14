variable "location" {
  description = "Azure region where all resources will be deployed"
  type        = string
  default     = "Sweden Central"
}

variable "team_name" {
  description = "Team name to identify resources (Fatima, Tasneem, Sara)"
  type        = string
  default     = "FatimaTasneemSara"
}

variable "vm_size" {
  description = "Size of the VM (Standard_B1s is free tier eligible)"
  type        = string
  default     = "Standard_B2s_v2"
}

variable "docker_image" {
  description = "Docker Hub image name from Sara's container"
  type        = string
  default     = "sackora/team-webapp:v1"
}