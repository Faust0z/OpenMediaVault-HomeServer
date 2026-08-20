# Tailscale Mesh VPN Integration

To avoid exposing services directly to the public internet via port forwarding, Tailscale provides a secure, encrypted WireGuard-based mesh network.

## Installation & Setup
```bash
# Install Tailscale on Debian host
curl -fsSL https://tailscale.com/install.sh | sh

# Authenticate server node
sudo tailscale up
```

## Remote Service Access
- **Private Network Subnet:** Access local SMB shares remotely via tailnet IP (100.x.x.x).
- **Zero Trust:** Node authorization required for new client devices prior to granting subnet network access.