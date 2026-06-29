#!/bin/bash

# Endurance CRM - Automated Deployment Script
# Target: Ubuntu 22.04+ VPS (India Region)
# Goal: Deploy the Sovereign Stack for Loop-Engineered WhatsApp CRM

set -e

echo "🚀 Starting Endurance CRM Automatic Build..."

# 1. System Update & Basic Dependencies
echo "📦 Updating system and installing dependencies..."
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y curl git wget jq

# 2. Docker Installation (The Foundation)
if ! command -v docker &> /dev/null; then
    echo "🐳 Installing Docker..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker $USER
fi

# 3. Dokploy Installation (The PaaS Layer)
if ! command -v dokploy &> /dev/null; then
    echo "🛠️ Installing Dokploy (Private PaaS)..."
    # Dokploy installation command
    curl -sL https://dokploy.com/install.sh | sh
fi

# 4. Launch the Sovereign Stack
echo "🏗️ Launching Sovereign Stack (n8n, Postgres, MinIO)..."
cd ~/vps-setup
sudo docker compose up -d

# 5. Initial Health Check
echo "🔍 Verifying deployment..."
sleep 30 # Wait for containers to stabilize

services=("n8n" "postgres" "minio")
for service in "${services[@]}"; do
    if sudo docker ps --format '{{.Names}}' | grep -q "$service"; then
        echo "✅ $service is RUNNING"
    else
        echo "❌ $service FAILED to start"
    fi
done

echo "==========================================================="
echo "🎉 Deployment Complete!"
echo "🌐 n8n Dashboard: http://$(curl -s ifconfig.me):5678"
echo "🌐 Dokploy Panel: http://$(curl -s ifconfig.me):3000"
echo "💾 Database: PostgreSQL (pgvector) on port 5432"
echo "📦 Lakehouse: MinIO on port 9000"
echo "==========================================================="
echo "Next Step: Run 'python3 checkpoints.py' to verify the Loop logic."
