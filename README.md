# 🖥️ Self-Hosted Bare-Metal Home Lab & Media Server

Documentation, orchestration configs, and automation scripts for my self-hosted home server running on Debian/OMV. Designed to handle storage, private photo sync, and database backups under strict hardware constraints.

## ⚙️ Hardware Specifications & Operating System
* **CPU:** AMD A6-7400K (2 Cores @ 3.5GHz)
* **RAM:** 4GB DDR3 (Optimized JVM and Postgres shared memory allocations)
* **Storage:** 500GB HDD (Custom EXT4 dual-partitioning via GParted Live)
* **OS:** Debian 12 (via OpenMediaVault 7)

## 🚀 Deployed Services (Docker Compose)
* **Immich Stack:** Self-hosted photo/video backup (Server, Machine Learning, Postgres vector, Redis).
* **Tailscale:** Mesh VPN overlay network for secure remote access without opening public ports.
* **SMB/CIFS Shares:** Local network file management with granular ACLs.

## 🛠️ Key SysAdmin & DevOps Tasks Documented
1. **Custom Storage Partitioning:** Bypassed OMV single-disk OS lock by manually re-partitioning system & data mounts via `gparted-live`.
2. **Containerized CLI Migration:** Isolated `immich-cli` inside Docker containers to bypass deprecated Debian package repositories for mass media imports.
3. **Resource Tuning:** Configured PostgreSQL memory bounds (`shm_size: 128mb`) and HDD flags (`DB_STORAGE_TYPE: HDD`) to prevent disk thrashing on legacy hardware.
