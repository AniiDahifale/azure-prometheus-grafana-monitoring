# 📈 Monitoring an Azure VM using Prometheus, Node Exporter & Grafana

This project demonstrates how I deployed and configured a real-time monitoring stack on a Microsoft Azure Ubuntu VM using:

- ✅ **Prometheus** – to scrape metrics
- ✅ **Node Exporter** – to collect Linux system metrics
- ✅ **Grafana** – to visualize data in real-time dashboards

---

## 💻 Project Setup Summary

- **VM Name**: `Ani-Monitor-VM`
- **Cloud**: Microsoft Azure
- **OS**: Ubuntu 20.04 LTS
- **Public IP**: `20.204.45.113` *(example IP)*
- **Prometheus Port**: `9090`
- **Node Exporter Port**: `9100`
- **Grafana Port**: `3000`

---

## 🚀 How I Did It

### Step 1: Provisioned the VM on Azure

I launched a VM named `Ani-Monitor-VM` from the Azure portal:

```bash
VM Name       : Ani-Monitor-VM
Size          : Standard B1s
Public IP     : 20.204.45.113
NSG Rules     : 22, 3000, 9090, 9100 (TCP allowed)
