#!/bin/bash

# Create user
sudo useradd --no-create-home --shell /bin/false node_exporter

# Download and extract Node Exporter
cd /tmp
curl -LO https://github.com/prometheus/node_exporter/releases/download/v1.8.1/node_exporter-1.8.1.linux-amd64.tar.gz
tar -xvf node_exporter-1.8.1.linux-amd64.tar.gz
cd node_exporter-1.8.1.linux-amd64

# Move binary
sudo cp node_exporter /usr/local/bin/
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

# Create systemd service
cat <<EOF | sudo tee /etc/systemd/system/node_exporter.service
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOF

# Start and enable Node Exporter
sudo systemctl daemon-reexec
sudo systemctl enable node_exporter
sudo systemctl start node_exporter
