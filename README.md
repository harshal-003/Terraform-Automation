# Terraform-Ansible-Docker Deployment

This project automates the deployment of a Dockerized application using Terraform, Ansible, and AWS EC2.

## Overview
This setup provisions an EC2 instance using Terraform, configures it with Ansible, and deploys a Docker container to run a portfolio website.

## Prerequisites
Ensure you have the following installed on your local machine:
- Terraform (>= 1.2.0)
- Ansible
- AWS CLI (configured with necessary IAM permissions)
- SSH key pair for EC2
- Docker

## Deployment Steps

### 1. Clone the Repository
```bash
git clone https://github.com/your-username/terraform-ansible-docker.git
cd terraform-ansible-docker
```

### 2. Initialize and Apply Terraform
```bash
terraform init
terraform apply -auto-approve
```
Terraform will provision an EC2 instance and output its public IP.

### 3. Deploy with Ansible and Docker
Run the deployment script:
```bash
bash deploy.sh
```
This script:
- Fetches the EC2 instance public IP
- Creates an Ansible inventory file
- Ensures SSH connectivity
- Runs an Ansible playbook to install Docker
- Pulls and runs the Dockerized portfolio application

### 4. Access the Application
Once deployed, access the portfolio at:
```
http://<INSTANCE_PUBLIC_IP>
```

## Cleanup
To destroy the infrastructure:
```bash
terraform destroy -auto-approve
```

## Future Enhancements
- Integrate a CI/CD pipeline
- Use Terraform remote state management
- Implement security best practices

## License
This project is licensed under the MIT License.

