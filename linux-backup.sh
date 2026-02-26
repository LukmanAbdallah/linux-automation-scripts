#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/logging.sh"

SOURCE_DIR="${1:-/etc}"
BACKUP_DIR="/backup"
DATE=$(date +%F)

mkdir -p "$BACKUP_DIR"

ARCHIVE="$BACKUP_DIR/backup-$DATE.tar.gz"

log_info "Creating backup of $SOURCE_DIR"
tar -czf "$ARCHIVE" "$SOURCE_DIR"

log_info "Removing backups older than 7 days"
find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +7 -delete

log_info "Backup completed: $ARCHIVE"
