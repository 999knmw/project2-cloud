variable "location" {
  description = "Azure region where all resources will be deployed"
  type        = string
  default     = "Sweden Central"
}

variable "team_name" {
  description = "Team name to identify resources (Fatima, Tasneem, Sara)"
  type        = string
  default     = "FatimaTasneemSaraV2"
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
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC4nrt5BoBcfAD2WwbSUQEoUzWCAPqcsBFWU6dOISVC10aO4UUofa0CZP+DZQ022vbfEca4eiZUjxIDlM3mfFY7hLFslgiZqoC3DMDZxGxvG6XyQs1ljEntabD+njq3NmXViM8EUI0tclNVqK3NNb00aq50BUNrrx++/WnJOslU+lLh1RqUDijDo/bpVb7qAHh7DPhyJsOTzxC6Qn6Aehatw37RnC8YndiGUhZOaH/x1sub/qqUW045Ji3NPi7Y5rP0xlNePrVCF4f2mdE3ctvCulmnvkXbeHTDTc8PXCrdQg0JGHX61D5JQYWhJ8pdtK+2UKdo+Fph+9IPa1T3BguRrDSCmjyseyWpEdjXqe+kewsmTvlZtghBW0x5VdctA0Y5pE1YCQGs+RG3wcigx04F9BjmwAQse7ASh0SWyaCY3zA3YN55Mo0iL8ExqnAM2EsYyEAgZXwKAf4pYIofOgClzNptfOWEQ/x55DnQ2InBnfAW4ikdFOwkS/Dc7J8w4Ujlm/+PYVuf+hjHvJSNrH8Wcrk95AJpqUryISkr7rVPlQDRPbaKZJ15ZLw4PFSI06l3GVg5GAHycKkdBabxEa+J/ENrskEYKtHyhP0j6iriWZAmFamy5m8YaJlMw6ghBnRhgCrYxmQk2RltIgvugde5DYgGTc8Hdn/3mf3m0SID7Q== fatim@michaelkaiser"
}