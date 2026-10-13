```

### Core Architecture & Zero-Trust Decisions
* **Web Tier:** Azure App Service (Linux PaaS, Python 3.11) with Regional Virtual Network (VNet) Integration.
* **Identity & Secrets:** System-Assigned Managed Identity querying Azure Key Vault via RBAC (`Key Vault Secrets User`). Zero database passwords stored in code or configuration files.
* **Data Tier:** Azure SQL Database Serverless (auto-pauses during idle periods) with public internet ingress completely disabled (`publicNetworkAccess: Disabled`).
* **Private Networking:** Private Endpoints and Private DNS Zones (`privatelink.database.windows.net`) ensuring database traffic never traverses the public internet.
* **Observability:** Centralized Log Analytics Workspace and Application Insights distributed tracing.
* **Remote State Backend:** Azure Blob Storage with automated state leasing and concurrency locking.

---

## Repository Structure

```text
├── .github/workflows/
│   └── terraform.yml          # GitHub Actions CI/CD Pipeline
├── modules/
│   ├── networking/            # VNet, Subnets, Private DNS Zones
│   ├── security/              # Key Vault & RBAC permissions
│   ├── database/              # Azure SQL Serverless & Private Endpoint
│   ├── compute/               # App Service, VNet Integration, Identity
│   └── monitoring/            # Log Analytics & Application Insights
├── main.tf                    # Root orchestration
├── variables.tf               # Environment input variables
├── outputs.tf                 # Exported endpoints & resource IDs
├── providers.tf               # AzureRM provider & remote backend
└── .gitignore                 # Strict secrets and state exclusion
```

---

## Verification & Testing

1. **Database Network Isolation:** Verified that external connections to port 1433 reject public client queries (`publicNetworkAccess: Disabled`).
2. **Private DNS Resolution:** Confirmed Private Endpoint resolves to an internal RFC 1918 address (`10.100.2.x`) within the Virtual Network.
3. **Key Vault Reference Injection:** Validated that App Service retrieves `DB_CONNECTION_STRING` dynamically via Key Vault reference syntax `@Microsoft.KeyVault(...)`.

---

## Author
**Aijaz Hussain**  
*IT Support Specialist & Junior Cloud Engineer*  
*Toronto, ON, Canada*
