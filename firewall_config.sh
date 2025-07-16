#!/bin/bash

# ----------------------------------
# Firewall Configuration Script
# ----------------------------------

echo "====> Configuring UFW to allow required ports..."

# Allow SSH
sudo ufw allow 22/tcp

# Allow Prometheus port
sudo ufw allow 9090/tcp

# Allow Node Exporter port
sudo ufw allow 9100/tcp

# Allow Grafana port
sudo ufw allow 3000/tcp

# Enable UFW if not already enabled
sudo ufw --force enable

echo "====> ✅ Firewall configuration complete. Allowed ports: 22, 9090, 9100, 3000"
