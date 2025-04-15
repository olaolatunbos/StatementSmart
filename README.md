## Overview

This repository automates the process of building, testing, and deploying a Flask application to Azure Container Apps using GitHub Actions. The workflow ensures that every push event to the `main` branch triggers a CI/CD pipeline.

## Diagram
![Azure (2024) framework-2](https://github.com/user-attachments/assets/0efc006d-89d8-4e1c-b914-2ecd9e39aa8c)


## Features

- Automated build and test for the Flask app
- Docker image creation and push to Azure Container Registry (ACR)
- Deployment to Azure Container Apps
- Infrastructure as Code using Terraform


## Terraform Configuration

The Terraform configuration (`terraform/`) manages infrastructure deployment.
