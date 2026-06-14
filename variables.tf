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
variable "ssh_public_key" {
  description = "SSH public key for VM access"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC4nrt5BoBcFaD2WwbSUQEoUzWCAPqcsBFWu6dOISVC10aO4UUofa0CZP+DZQ022vbFEca4eiZUjxIDlM3mffY7hLFs1gizQoc3DMDZxGxvG6XyQs1ljEntabD+njq3NmXViM8EUI0tc1NVqK3NNb00aq50BUNRrx++/WnJOs1U+lH1RqUDijDo/bpVb7QAhh7DPhYJsOTzxC6Qn6Aehatw37RnC8YndiGUhZoAH/x1sub/qqUW045Ji3NPi7Y5Rp0X1NePrVCF4f2mdE3ctvCulmnvKXxbeHTDtC8PXCRdQg0JGHX61D5JQYWhJ8pdtK+2UkDo+FPh+9IPa1T3BguRrDSCmjseyWpEdjXqe+kewsmTv1ZtghBW0x5Vdcta0Y5pE1YCQGs+RG3wcigx04f9BjmwAQse7Ash0SWyaCY3zA3YN55Mo0iL8ExqNAM2EsYyEAgZXwKaF4pYiofOgClzNptfOWEQ/x55DnQ2iNBnFAW4ikdFoWKs/Dc7J8w4Ujlm/+PYVuf+hjHvJSNrH8Wcrk95AjpQUryISkr7rvP1QDRpbakZJ15ZLW4PFSI0613GvG5GAHyckKdBabxEa+J/ENrsKEYKtHyhP0j6iriWZAmFamy5m8YaJlMw6ghBnRhgCrYxmQk2RlTIgvugde5DYgGTc8Hdn/3mf3m0SID7Q== fatim@michaelkaiser"
}