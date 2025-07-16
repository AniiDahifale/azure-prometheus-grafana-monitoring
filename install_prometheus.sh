#!/bin/bash

# -------------------------------
# Prometheus Installation Script
# Target OS: Ubuntu 20.04
# -------------------------------

echo "====> [1/12] Creating Prometheus user and directories..."

sudo useradd --no-create-home --shell /bin/false prometheus
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus

echo "====> [2/12] Updating ownership for Prometheus directories..."
sudo chown prometheus:prometheus /etc/prometheus
sudo chown prometheus:prometheus /var/lib/prometheus

echo "====> [3/12] Downloading Prometheus 2.26.0 binary..."

cd /opt/
wget https://github.com/prometheus/prometheus/releases/download/v2.26.0/prometheus-2.26.0.linux-amd64.tar.gz

echo "====> [4/12] Verifying checksum and extracting archive..."
sha256sum prometheus-2.26.0.linux-amd64.tar.gz
tar -xvf prometheus-2.26.0.linux-amd64.tar.gz
cd prometheus-2.26.0.linux-amd64

echo "====> [5/12] Copying Prometheus binaries..."
sudo cp prometheus /usr/local/bin/
sudo cp promtool /usr/local/bin/

echo "====> [6/12] Updating ownership for binaries..."
sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool

echo "====> [7/12] Copying console libraries and configuration..."
sudo cp -r consoles /etc/prometheus
sudo cp -r console_libraries /etc/prometheus
sudo cp prometheus.yml /etc/prometheus

echo "====> [8/12] Updating ownership for config files..."
sudo chown -R prometheus:prometheus /etc/prometheus/consoles
sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries
sudo chown prometheus:prometheus /etc/prometheus/prometheus.yml

echo "====> [9/12] Verifying installed versions..."
prometheus --version
promtool --version

echo "====> [10/12] Creating Prometheus systemd service file..."

cat <<EOF | sudo tee /etc/systemd/system/prometheus.service
[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \\
  --config.file=/etc/prometheus/prometheus.yml \\
  --storage.tsdb.path=/var/lib/prometheus/ \\
  --web.console.templates=/etc/prometheus/consoles \\
  --web.console.libraries=/etc/prometheus/console_libraries

[Install]
WantedBy=multi-user.target
EOF

echo "====> [11/12] Enabling and starting Prometheus service..."
sudo systemctl daemon-reload
sudo systemctl start prometheus
sudo systemctl enable prometheus

echo "====> [12/12] Allowing port 9090 through firewall..."
sudo ufw allow 9090/tcp

echo "====> ✅ Prometheus installation completed. Access it via http://<your-vm-ip>:9090"
