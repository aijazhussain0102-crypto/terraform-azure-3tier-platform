output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "app_subnet_id" {
  value = azurerm_subnet.snet_app.id
}

output "data_subnet_id" {
  value = azurerm_subnet.snet_data.id
}

output "sql_private_dns_zone_id" {
  value = azurerm_private_dns_zone.dns_sql.id
}
