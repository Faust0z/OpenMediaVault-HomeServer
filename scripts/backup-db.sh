#!/usr/bin/env bash
# ==============================================================================
# Automated PostgreSQL Dump & Retention Script
# Creates compressed dumps and purges backups older than N days.
# ==============================================================================

set -euo pipefail

CONTAINER_NAME="immich_postgres"
DB_USER="immich_user"
DB_NAME="immich"
BACKUP_DIR="/srv/dev-disk-by-uuid-YOUR_UUID/backups/postgres"
RETENTION_DAYS=7
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="${BACKUP_DIR}/immich_db_${TIMESTAMP}.sql.gz"

mkdir -p "${BACKUP_DIR}"

echo "Starting database backup for container [${CONTAINER_NAME}]..."

docker exec -t "${CONTAINER_NAME}" pg_dump -U "${DB_USER}" "${DB_NAME}" | gzip > "${BACKUP_FILE}"

echo "Backup successfully saved to: ${BACKUP_FILE}"

# Cleanup old backups
echo "Cleaning up backups older than ${RETENTION_DAYS} days..."
find "${BACKUP_DIR}" -type f -name "immich_db_*.sql.gz" -mtime +"${RETENTION_DAYS}" -delete

echo "Backup and cleanup cycle complete."