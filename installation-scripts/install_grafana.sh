#!/bin/bash

# -------------------------------
# Grafana Installation Script
# Target OS: Ubuntu 20.04
# -------------------------------

echo "====> [1/5] Updating packages and installing dependencies..."
sudo apt-get update -y
sudo apt-get install -y software-properties-common wget apt-transport-https

echo "====> [2/5] Adding Grafana APT repository..."
sudo wget -q -O /usr/share/keyrings/grafana.key https://apt.grafana.com/gpg.key
echo "deb [signed-by=/usr/share/keyrings/grafana.key] https://apt.grafana.com stable main" | sudo tee /etc/apt/sources.list.d/grafana.list

echo "====> [3/5] Installing Grafana..."
sudo apt-get update -y
sudo apt-get install -y grafana

echo "====> [4/5] Enabling and starting Grafana service..."
sudo systemctl enable grafana-server
sudo systemctl start grafana-server

echo "====> [5/5] Allowing port 3000 through firewall..."
sudo ufw allow 3000/tcp

echo "====> ✅ Grafana installation completed. Access it via http://<your-vm-ip>:3000"
