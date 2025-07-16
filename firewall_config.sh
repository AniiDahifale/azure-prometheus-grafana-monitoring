#!/bin/bash

# Allow required ports
sudo ufw allow 22/tcp     # SSH
sudo ufw allow 9090/tcp   # Prometheus
sudo ufw allow 9100/tcp   # Node Exporter
sudo ufw allow 3000/tcp   # Grafana

# Enable UFW
sudo ufw enable
sudo ufw reload
