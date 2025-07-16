#!/bin/bash

# -------------------------------
# Node Exporter Installation Script
# Target OS: Ubuntu 20.04
# -------------------------------

echo "====> [1/6] Creating node_exporter user..."
sudo useradd --no-create-home --shell /bin/false node_exporter

echo "====> [2/6] Downloading Node Exporter..."
cd /opt/
wget https://github.com/prometheus/node_exporter/releases/download/v1.6.1/node_exporter-1.6.1.linux-amd64.tar.gz

echo "====> [3/6] Extracting Node Exporter archive..."
tar -xvf node_exporter-1.6.1.linux-amd64.tar.gz
sudo cp node_exporter-1.6.1.linux-amd64/node_exporter /usr/local/bin/

echo "====> [4/6] Setting ownership and permissions..."
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

echo "====> [5/6] Creating systemd service file..."

cat <<EOF | sudo tee /etc/systemd/system/node_exporter.service
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOF

echo "====> [6/6] Enabling and starting Node Exporter service..."
sudo systemctl daemon-reload
sudo systemctl enable node_exporter
sudo systemctl start node_exporter

echo "====> ✅ Node Exporter is running on port 9100. Access via http://<your-vm-ip>:9100/metrics"
