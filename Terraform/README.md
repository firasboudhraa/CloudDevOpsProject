# ☁️ Cloud DevOps Project (Terraform Infrastructure Provisioning)

This module provisions the foundational infrastructure for a **Cloud DevOps pipeline on Azure** using **Terraform** with a modular structure. It includes a virtual network, public/private subnets, and a single VM to host Jenkins. The setup is designed to later support Ansible-driven configuration of a full CI/CD pipeline using Jenkins, SonarQube, K3s, ArgoCD, and Slack integration.

---

## 🚀 Project Overview

This project is part of a full DevOps workflow demonstrating **Infrastructure as Code (IaC)** using Terraform. It automates the provisioning of:

- Azure Resource Group
- Virtual Network (VNet)
- Public & Private Subnets
- Network Security Group (NSG)
- Public IP Address
- Network Interface (NIC)
- Linux Virtual Machine (Jenkins server + K3s control plane)

---

## 📁 Project Structure

CloudDevOpsProject/
├── Terraform/
│   ├── main.tf              # Root module calling network and compute
│   ├── variables.tf         # Global input variables
│   ├── outputs.tf           # Global outputs
│   ├── providers.tf         # Provider configuration (AzureRM)
│   ├── backend.tf           # Remote backend config (optional)
│   ├── Modules/
│   │   ├── Network/
│   │   │   ├── main.tf
│   │   │   ├── variables.tf
│   │   │   └── outputs.tf
│   │   └── Compute/
│   │       ├── main.tf
│   │       ├── variables.tf
│   │       └── outputs.tf
└── README.md

---

🌐 Infrastructure Diagram

+---------------------------+
|         Azure VM          |
| +----------------------+ |
| |   Jenkins Server      | |
| |   K3s Cluster         | |
| |   ArgoCD + SonarQube  | |
| +----------+-----------+ |
|            | NIC           |
+------------|---------------+
             |
     +-------v--------+
     |   Public Subnet |
     +--------+--------+
              |
     +--------v--------+
     |  Virtual Network |
     +------------------+
✅ Prerequisites
Azure account with subscription

Terraform v1.0+

Azure CLI installed and logged in

SSH access to VM (will be used by Ansible)

Basic understanding of Terraform modules
