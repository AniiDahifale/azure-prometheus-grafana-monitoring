#!/bin/bash

# Add Grafana APT repository
sudo apt-get install -y software-properties-common wget
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee /etc/apt/sources.list.d/grafana.list

# Install Grafana
sudo apt-get update
sudo apt-get install -y grafana

# Start and enable Grafana
sudo systemctl enable grafana-server
sudo systemctl start grafana-server
