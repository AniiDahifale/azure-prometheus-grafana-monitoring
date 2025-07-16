# 📈 Monitoring an Azure VM using Prometheus, Node Exporter & Grafana

This project demonstrates how I deployed and configured a real-time monitoring stack on a Microsoft Azure Ubuntu VM using:

- ✅ **Prometheus** – to scrape system metrics
- ✅ **Node Exporter** – to collect hardware and OS-level metrics
- ✅ **Grafana** – to visualize metrics using dashboards

---

##  Prerequisites

To follow or reproduce this setup, you will need:

- A Microsoft Azure account with permissions to create resources
- Basic knowledge of Linux command-line
- An Ubuntu 20.04 Virtual Machine (or later)
- Inbound NSG rules to allow ports: **22**, **9090**, **9100**, **3000**
- Public IP to access services from the browser

---

## 💻 Project Setup Summary

| Parameter       | Value                |
|----------------|----------------------|
| VM Name         | `Ani-Monitor-VM`     |
| Cloud           | Microsoft Azure      |
| OS              | Ubuntu 20.04 LTS     |
| Prometheus Port | `9090`               |
| Node Exporter   | `9100`               |
| Grafana         | `3000`               |
| Public IP       | `20.204.45.113` (example) |

---

## 📁 Repository Structure

```bash
.
├── README.md
├── FINAL-STEPS.md
├── scripts/
│   ├── install_prometheus.sh
│   ├── install_grafana.sh
│   ├── install_node_exporter.sh
│   └── firewall_config.sh
├── config/
│   ├── prometheus.yml
│   └── grafana-provisioning.yml