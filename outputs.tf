output "resource_group_name" {
  description = "Name of the Azure Resource Group created for this project"
  value       = azurerm_resource_group.rg.name
}

output "public_ip_address" {
  description = "Public IP address of the VM - use this to access the web app"
  value       = azurerm_public_ip.vm_public_ip.ip_address
}

output "virtual_machine_id" {
  description = "Azure resource ID of the provisioned Linux VM"
  value       = azurerm_linux_virtual_machine.vm.id
}