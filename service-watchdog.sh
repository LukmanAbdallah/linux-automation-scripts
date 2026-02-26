#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/logging.sh"

SERVICE_NAME="${1:-nginx}"

log_info "Checking service: $SERVICE_NAME"

if systemctl is-active --quiet "$SERVICE_NAME"; then
  log_info "$SERVICE_NAME is running."
else
  log_warn "$SERVICE_NAME is DOWN. Attempting restart."
  systemctl restart "$SERVICE_NAME"

  if systemctl is-active --quiet "$SERVICE_NAME"; then
    log_info "$SERVICE_NAME restarted successfully."
  else
    log_error "Failed to restart $SERVICE_NAME"
    exit 1
  fi
fi
