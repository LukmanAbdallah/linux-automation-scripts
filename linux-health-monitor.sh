#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/logging.sh"

THRESHOLD=80

cpu=$(top -bn1 | awk '/Cpu/ {print 100 - $8}')
mem=$(free | awk '/Mem:/ {printf("%.0f"), $3/$2 * 100}')
disk=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

log_info "CPU: ${cpu%.*}%"
log_info "MEM: ${mem}%"
log_info "DISK: ${disk}%"

if (( ${cpu%.*} > THRESHOLD || mem > THRESHOLD || disk > THRESHOLD )); then
  log_warn "System resources exceeded threshold!"
  exit 1
fi

log_info "System healthy."
