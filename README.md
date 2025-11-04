# 🛠️ Playground Deploy

This repository contains the **deployment setup** for the Playground project.  
It runs on a **Hostinger KVM server** using **Docker Compose**, with **Traefik** as a reverse proxy providing automatic HTTPS via **Let’s Encrypt**.

---

## 🚀 Current Status
✅ Frontend available at **https://app.andreas-dahm.eu**

📦 Backend and database will be added later.

---

## 📁 Structure
playground-deploy/
├─ docker-compose.yml # Main service definitions
├─ .env # Environment variables (not committed)
├─ traefik/
	├─ traefik.yml # Traefik configuration
	└─ acme.json # Let's Encrypt certificate storage

---

## ⚙️ Server Setup

### 1. Install Docker
```bash
apt update && apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
mkdir -p /opt/playground && cd /opt/playground
git clone https://github.com/andreasdahm/playground-deploy.git .
```

### 2. Create .env
```bash
FRONTEND_IMAGE=docker.io/lobosdocker/playground-frontend:main
FRONTEND_HOST=app.andreas-dahm.eu
LETSENCRYPT_EMAIL=andreas.dahm@gmail.com
```

### 3. Prepare Traefik
```bash
mkdir -p traefik
touch traefik/acme.json
chmod 600 traefik/acme.json
```

### 4. Start / Update
```bash
docker compose pull
docker compose up -d
```

### 5. 📊 Traefik Dashboard (optional)
# in docker-compose.yml (traefik service)
command:
  - --api.dashboard=true
  - --api.insecure=true

Then open: http://<SERVER-IP>:8080/dashboard/

---
## 🔒 Notes

Do not commit .env – it contains sensitive information.
acme.json stores certificates → keep permissions 600.
Firewall must allow ports 80 and 443.