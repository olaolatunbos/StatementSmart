## Overview

This repository automates the process of building, testing, and deploying a Flask application to Azure Container Apps using GitHub Actions. The workflow ensures that every push event to the `main` branch triggers a CI/CD pipeline.


The application is hosted here: https://taskmanagement-app.calmwave-e44aa654.uksouth.azurecontainerapps.io
## Diagram
![Azure (2024) framewo](https://github.com/user-attachments/assets/357851c1-1800-4e90-a5f4-f6293133fd47)




## Features

- Automated build and test for the Flask app
- Docker image creation and push to Azure Container Registry (ACR)
- Deployment to Azure Container Apps
- Infrastructure as Code using Terraform


## Terraform Configuration

The Terraform configuration (`terraform/`) manages infrastructure deployment.
