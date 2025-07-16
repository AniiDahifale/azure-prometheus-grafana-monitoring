# Final Steps After Installing Prometheus, Grafana, and Node Exporter

This document outlines what to do after executing all installation and configuration scripts on the Azure VM (Ani-Monitor-VM). It helps verify whether the setup is functioning correctly and how to begin monitoring the VM's system metrics.

---

## 1. Verify Services Are Running

Check the status of the services installed:


sudo systemctl status prometheus
sudo systemctl status node_exporter
sudo systemctl status grafana-server


If any service is not active, restart it:

sudo systemctl restart prometheus
sudo systemctl restart node_exporter
sudo systemctl restart grafana-server


## 2. Access the Web Interfaces

Use your VM's public IP address to access the following services in your browser:

| Service        | URL                                 |
|----------------|--------------------------------------|
| Prometheus     | http://<your-vm-ip>:9090             |
| Node Exporter  | http://<your-vm-ip>:9100/metrics     |
| Grafana        | http://<your-vm-ip>:3000             |

Replace `<your-vm-ip>` with the actual public IP of your Azure VM.

---

## 3. Add Prometheus as a Data Source in Grafana (if not auto-provisioned)

1. Login to Grafana at `http://<your-vm-ip>:3000` using the default credentials:  
   **Username**: `admin`  
   **Password**: `admin` (you will be prompted to change it)

2. Navigate to **Settings (Gear Icon) > Data Sources**

3. Click **Add data source** and select **Prometheus**

4. In the URL field, enter:
    http://localhost:9090


5. Click **Save & Test**. It should confirm that the data source is working.

---

## 4. Import a Grafana Dashboard for Node Exporter

To visualize system metrics:

1. In the Grafana UI, go to the **"+" menu > Import**

2. In the "Import via grafana.com" field, enter Dashboard ID: 1860


Or use this URL: [https://grafana.com/grafana/dashboards/1860](https://grafana.com/grafana/dashboards/1860)

3. Click **Load**

4. Select the Prometheus data source you configured earlier

5. Click **Import**

This will load a pre-configured dashboard to display real-time system metrics collected from Node Exporter.

---

## 5. Review the Metrics in Grafana

The dashboard provides the following system-level metrics from the Azure VM:

- CPU usage  
- Memory usage  
- Disk space and I/O  
- Network traffic  
- Load average and uptime  
- Filesystem utilization  

These metrics are exposed by **Node Exporter** and collected by **Prometheus**.



