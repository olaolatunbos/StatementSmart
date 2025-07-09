# Statement Smart

## Overview

StatementSmart is a web application that parses bank statement PDFs, converts them to structured Excel sheets and
automatically categorises transactions using machine learning

<img width="1156" alt="Screenshot 2025-07-08 at 15 42 55" src="https://github.com/user-attachments/assets/1a4a614d-0db3-4ec3-9f0a-a639b54138dc" />

## Table of Contents

- [Architecture Diagram](#architecture-diagram)
- [Quick Start](#quick-start)
- [Container Setup](#container-setup)

## Architecture Diagram

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
docker run -p 3000:3000 statement-smart 
```


## Key Features

- **Azure Continaer Apps**  
  Managed service for running containerized applications

- **Github Actions**  
  Used for creating CI/CD pieplines thatbuild, test, and deploy applications.

- **Azure Front Door**  
  Global, scalable entry point that provides load balancing, SSL termination, and fast failover for your applications.

- **Azure DNS**  
  DNS hosting service that allows you to manage DNS records using Azure infrastructure.

- **Terraform**  
  Infrastructure as Code (IaC) tool used to provision and manage Azure resources declaratively.



