# Automated Secure 3-Tier Cloud Platform on Microsoft Azure

A production-grade, Zero-Trust 3-Tier Web Application Infrastructure codified entirely in **Terraform** and deployed with **GitHub Actions**.

---

## Architecture Overview

```text
[ Public Internet ]
        │ (HTTPS / TLS 1.3)
        ▼
[ Azure App Service (Linux Web App) ]
        │
        ├── Regional VNet Integration (Private Outbound Subnet: 10.100.1.0/24)
        │
        ├── Entra ID Managed Identity ──► [ Azure Key Vault ] (Hardware-backed secrets)
        │
        ├── Private Endpoint (RFC 1918) ──► [ Azure SQL Database Serverless ] (10.100.2.x)
        │
        └── Observability Pipeline ──────► [ Application Insights & Log Analytics ]
