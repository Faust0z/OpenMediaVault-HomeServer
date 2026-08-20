#!/usr/bin/env bash
# ==============================================================================
# Immich Bulk Import via Containerized CLI
# Solves deprecated debian package issues by running the CLI inside Docker.
# ==============================================================================

set -euo pipefail

# Configuration variables
API_KEY="${IMMICH_API_KEY:-your_api_key_here}"
INSTANCE_URL="${IMMICH_URL:-http://localhost:2283/api}"
TARGET_DIR="${1:-/import}"
ALBUM_NAME="${2:-vacaciones}"

if [ -z "${1:-}" ]; then
  echo "Error: Path to import directory is required."
  echo "Usage: ./bulk-import.sh <LOCAL_MOUNT_PATH> [ALBUM_NAME]"
  exit 1
fi

echo "🚀 Starting bulk import from: ${TARGET_DIR} into album: ${ALBUM_NAME}"

docker run --rm -it \
  --network host \
  -e IMMICH_API_KEY="${API_KEY}" \
  -e IMMICH_INSTANCE_URL="${INSTANCE_URL}" \
  -v "${TARGET_DIR}":/import \
  ghcr.io/immich-app/immich-cli:latest \
  upload --recursive --album "/import/${ALBUM_NAME}"

echo "Import process completed."