# 🚀 Terraform-Ansible-Docker Deployment

This project automates the deployment of a Dockerized application using Terraform, Ansible, and AWS EC2.

## 📌 Overview
This setup provisions an EC2 instance using Terraform, configures it with Ansible, and deploys a Docker container to run a portfolio website.

## 🛠 Prerequisites
Ensure you have the following installed on your local machine:
- 🌍 Terraform (>= 1.2.0)
- 📜 Ansible
- ☁️ AWS CLI (configured with necessary IAM permissions)
- 🔑 SSH key pair for EC2
- 🐳 Docker

## 🚀 Deployment Steps

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/harshal-003/Terraform-Automation.git
cd terraform-ansible-docker
```

### 2️⃣ Initialize and Apply Terraform
```bash
terraform init
terraform apply -auto-approve
```
Terraform will provision an EC2 instance and output its public IP.

### 3️⃣ Deploy with Ansible and Docker
Run the deployment script:
```bash
bash deploy.sh
```
This script:
- 🔍 Fetches the EC2 instance public IP
- 📄 Creates an Ansible inventory file
- 🔑 Ensures SSH connectivity
- ⚙️ Runs an Ansible playbook to install Docker
- 🚢 Pulls and runs the Dockerized portfolio application

### 4️⃣ Access the Application
Once deployed, access the portfolio at:
```
http://<INSTANCE_PUBLIC_IP>
```

## 🧹 Cleanup
To destroy the infrastructure:
```bash
terraform destroy -auto-approve
```

## 🔮 Future Enhancements
- 🔄 Integrate a CI/CD pipeline
- 🗂 Use Terraform remote state management
- 🔐 Implement security best practices

---

# 🏗 Terraform Docker Setup

This project uses Terraform to manage a Docker container running a Flask application.

## 📌 Prerequisites

Ensure you have the following installed on your system:
- 🛠 [Terraform](https://developer.hashicorp.com/terraform/downloads)
- 🐳 [Docker](https://docs.docker.com/get-docker/)

## ⚙️ Setup Instructions

1️⃣ **Clone the Repository**
   ```sh
   git clone https://github.com/harshal-003/Terraform-Automation.git

   ```

2️⃣ **Initialize Terraform**
   ```sh
   terraform init
   ```

3️⃣ **Validate the Configuration**
   ```sh
   terraform validate
   ```

4️⃣ **Apply the Configuration**
   ```sh
   terraform apply -auto-approve
   ```
   This will start a Docker container using the local Flask image.

5️⃣ **Verify the Running Container**
   ```sh
   docker ps
   ```

6️⃣ **Destroy the Resources** (if needed)
   ```sh
   terraform destroy -auto-approve
   ```

## 📝 Notes
- 🔧 The Terraform script expects an existing Docker image named `flask-app`. Ensure the image is built before applying Terraform.
  ```sh
  docker build -t flask-app .
  ```
- 🛠 Modify `main.tf` if you need additional configurations.

## 📜 License
This project is open-source and can be modified as needed.

