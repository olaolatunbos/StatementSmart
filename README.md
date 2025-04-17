## Overview

This repository automates the process of building, testing, and deploying a Flask application to Azure Container Apps using GitHub Actions. The workflow ensures that every push event to the `main` branch triggers a CI/CD pipeline.


The application is hosted here: https://www.taskmanagement-app.com
## Architecture
![Azure (2024) framework-3](https://github.com/user-attachments/assets/c7afdb6c-0cfa-4b3d-adde-57c596b8ee63)




## Features

- Automated build and test for the Flask app
- Docker image creation and push to Azure Container Registry (ACR)
- Deployment to Azure Container Apps
- Infrastructure as Code using Terraform


## Terraform Configuration

The Terraform configuration (`terraform/`) manages infrastructure deployment.
