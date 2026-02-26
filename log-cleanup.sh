#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/logging.sh"

LOG_DIR="/var/log"
DAYS_OLD=14

log_info "Compressing logs older than $DAYS_OLD days"
find "$LOG_DIR" -type f -name "*.log" -mtime +$DAYS_OLD -exec gzip {} \;

log_info "Removing compressed logs older than 30 days"
find "$LOG_DIR" -type f -name "*.gz" -mtime +30 -delete

log_info "Log cleanup complete."
