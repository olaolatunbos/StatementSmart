## Overview

This repository automates the process of building, testing, and deploying a Flask application to Azure Container Apps using GitHub Actions. The workflow ensures that every push event to the `main` branch triggers a CI/CD pipeline.

## Diagram
[Azure (2024) framework-2.pdf](https://github.com/user-attachments/files/19764367/Azure.2024.framework-2.pdf)

## Features

- Automated build and test for the Flask app
- Docker image creation and push to Azure Container Registry (ACR)
- Deployment to Azure Container Apps
- Infrastructure as Code using Terraform


## Terraform Configuration

The Terraform configuration (`terraform/`) manages infrastructure deployment.
