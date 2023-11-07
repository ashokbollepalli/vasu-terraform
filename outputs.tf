output "public_ip_address" {
  value = azurerm_public_ip.example.ip_address
}

# output "storage_account_connection_string" {
#   value = azurerm_storage_account.example.primary_connection_string
# }

# output "container_url" {
#   value = azurerm_storage_container.example.primary_blob_endpoint
# }