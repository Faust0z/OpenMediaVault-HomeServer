# OpenMediaVault & Debian Installation Notes

## Custom Dual Partitioning (GParted)
OpenMediaVault (OMV) default installer claims the entire physical drive for the OS, blocking data shares on single-disk machines.

1. Booted into `gparted-live-1.7.0` via USB.
2. Partitioned the `/dev/sda` 500GB HDD into:
   * **OS Partition (`/dev/sda1`):** 25GB (EXT4) for OpenMediaVault / Debian system files.
   * **Data Partition (`/dev/sda2`):** Remaining space (EXT4) mounted to `/srv/dev-disk-by-uuid-...` for container data and media storage.

## System Maintenance
OMV wraps Debian's Advanced Package Tool (APT). System upgrades are managed directly via console or OMV wrapper:

```bash
# Clean APT cache and upgrade system services gracefully
sudo omv-upgrade
```

## Storage & Users Configuration
Created non-root system user with explicit PUID/PGID (1000:100).

Configured SMB/CIFS shares pointing to persistent EXT4 volumes for local network backup access.