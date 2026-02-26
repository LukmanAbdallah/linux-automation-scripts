# 🚀 Linux Automation Scripts (DevOps Toolkit)

Production-ready Bash automation scripts for Linux system administration, reliability, and operational excellence.

## ✨ Features

- Enterprise-grade logging  
- systemd service & timer support  
- Cron automation examples  
- Idempotent Bash scripting  
- Production-style error handling  
- ShellCheck-friendly code  

---

## 📦 Included Scripts

### 🔄 Service Watchdog
Automatically monitors and restarts critical services.

**Usage:**

sudo ./service-watchdog.sh nginx

---

### 📊 Linux Health Monitor

sudo ./linux-health-monitor.sh

---

### 💾 Linux Backup

sudo ./linux-backup.sh /etc

---

### 🧹 Log Cleanup

sudo ./log-cleanup.sh

---

## 🪵 Logging

/var/log/linux-automation.log

---

## ⏱️ systemd Timer Setup

sudo cp systemd/*.service /etc/systemd/system/
sudo cp systemd/*.timer /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now service-watchdog.timer

---

## 🕒 Cron Examples

See cron-examples.txt

---

## 📄 License

MIT License
