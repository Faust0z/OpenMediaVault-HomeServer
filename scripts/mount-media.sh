#!/usr/bin/env bash
# ==============================================================================
# Optical Media Mount & Permission Reset Script
# Automates mounting legacy media drives and adjusting ownership for OMV/SMB.
# ==============================================================================

set -euo pipefail

MOUNT_POINT="/media/cdrom"
DEVICE="/dev/sr0"
USER_ID="1000"
GROUP_ID="100"

mkdir -p "${MOUNT_POINT}"

echo "Mounting ${DEVICE} to ${MOUNT_POINT}..."
sudo mount "${DEVICE}" "${MOUNT_POINT}" || echo "Media already mounted or drive empty."

echo "Resetting permissions on shared volume..."
sudo chown -R "${USER_ID}:${GROUP_ID}" "${MOUNT_POINT}"
sudo chmod -R 777 "${MOUNT_POINT}"

echo "Media ready at ${MOUNT_POINT}."