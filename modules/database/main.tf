resource "random_password" "admin_password" {
  length  = 20
  special = true
}

resource "azurerm_mssql_server" "sql_server" {
  name                          = var.sql_server_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  version                       = "12.0"
  administrator_login           = "cloudadmin"
  administrator_login_password  = random_password.admin_password.result
  public_network_access_enabled = false
}

resource "azurerm_mssql_database" "db" {
  name                        = "db-cloudscale-core"
  server_id                   = azurerm_mssql_server.sql_server.id
  collation                   = "SQL_Latin1_General_CP1_CI_AS"
  sku_name                    = "GP_S_Gen5_1"
  min_capacity                = 0.5
  auto_pause_delay_in_minutes = 60
}

resource "azurerm_private_endpoint" "sql_pe" {
  name                = "pe-sql-database"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.data_subnet_id

  private_service_connection {
    name                           = "conn-sql-private"
    private_connection_resource_id = azurerm_mssql_server.sql_server.id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "dns-group-sql"
    private_dns_zone_ids = [var.sql_private_dns_zone_id]
  }
}
