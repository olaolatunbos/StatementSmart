# Statement Smart

## Overview

StatementSmart is a web application that parses Lloyds Bank statement PDFs, converts them to structured Excel sheets and
automatically categorises transactions using machine learning

<img width="1156" alt="Screenshot 2025-07-08 at 15 42 55" src="https://github.com/user-attachments/assets/1a4a614d-0db3-4ec3-9f0a-a639b54138dc" />


## 🏛️ Architecture Diagram

![ss drawio](https://github.com/user-attachments/assets/b8922449-f701-4f45-b6d8-efe7bc99aa40)

## 🚀 Quick Start
```bash
# Get OPENAI_API_KEY from https://platform.openai.com/playground/prompts and add to .env file.
OPENAI_API_KEY='Your API key'

python3 -m venv venv
source venv/bin/activate

pip install -r requirements.txt

python app.py
```

## 🐳 Container Setup
```bash
docker build -t statement-smart .
docker run --env-file .env -p 3000:3000 statement-smart 
```

## Project Structure
```bash
.
├── .github
│   └── workflows
│       ├── deploy-app.yml
│       ├── terraform-destroy.yml
│       └── terraform-plan-and-apply.yml
├── .gitignore
├── README.md
├── app
│   ├── .DS_Store
│   ├── .env
│   ├── Dockerfile
│   ├── __pycache__
│   │   └── openai.cpython-312.pyc
│   ├── app.py
│   ├── name.py
│   ├── requirements.txt
│   ├── static
│   │   └── style.css
│   ├── templates
│   │   └── index.html
│   ├── uploads
│   │   └── new3.pdf
│   └── venv
│       ├── bin
│       ├── include
│       ├── lib
│       └── pyvenv.cfg
└── terraform
    ├── .terraform
    │   ├── modules
    │   ├── providers
    │   └── terraform.tfstate
    ├── main.tf
    ├── modules
    │   ├── container_app
    │   ├── container_app_environment
    │   ├── container_registry
    │   ├── dns_zone
    │   ├── front_door
    │   ├── log_analytics
    │   └── storage_account
    ├── terraform.tf
    └── variables.tf
```

## 🔧 Pipelines
### deploy-app.yml
- Builds a Docker image from the Flask app, scans it with Trivy for vulnerabilities, pushes it to Azure Container Registry (ACR), and deploys it to Azure Container Apps.
### terraform-plan-and-apply.yml
- Runs a Checkov security scan, formats and validates Terraform code, and posts the Terraform plan to the pull request as a comment. On manual trigger, it applies the approved       Terraform plan to provision Azure infrastructure.
### terraform-destroy.yml
- Manually triggered workflow that initializes the Terraform backend and destroys all previously provisioned infrastructure in Azure.
<img width="507" height="639" alt="Screenshot 2025-07-12 at 11 02 58" src="https://github.com/user-attachments/assets/1b2637cf-e729-4fd9-984f-cec6a98fe57c" />
<img width="321" height="552" alt="Screenshot 2025-07-12 at 11 01 46" src="https://github.com/user-attachments/assets/5934785a-f5a2-439d-ad10-9fb1a2fd0824" />


## 🟣 Terraform
The terraform/ directory provisions all necessary Azure infrastructure to support deployment and delivery of the application to end users.

Provisioned Resources:
- Azure Container Apps:
  Hosts the application in a fully managed, serverless container environment with built-in scaling and HTTPS support.
- Azure Container Registry (ACR):
  Stores and manages private Docker container images used for deployments.
- Azure DNS:
  Manages custom domain names and DNS records for routing traffic to application endpoints.
- Azure Front Door:
  Acts as a global entry point, providing load balancing, SSL termination, and fast content delivery through Microsoft's edge network.





