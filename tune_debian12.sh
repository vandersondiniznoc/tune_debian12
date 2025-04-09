#!/bin/bash
set -e

echo "🚀 Iniciando tuning do sistema Debian 12..."

# 1. Backup do sysctl atual
cp /etc/sysctl.conf /etc/sysctl.conf.bkp.$(date +%F)

# 2. Aplicar parâmetros de tunning no kernel
cat <<EOF >> /etc/sysctl.d/99-tuning.conf

# 📦 Melhoria de performance geral
vm.swappiness = 10
vm.dirty_ratio = 10
vm.dirty_background_ratio = 5

# 🧠 Otimização de cache
vm.vfs_cache_pressure = 50

# 🔧 File descriptors
fs.file-max = 2097152

# 📡 Rede - buffers e filas
net.core.rmem_max = 16777216
net.core.wmem_max = 16777216
net.core.netdev_max_backlog = 50000
net.core.somaxconn = 4096

# 📶 TCP otimização
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_fin_timeout = 10
net.ipv4.tcp_keepalive_time = 600
net.ipv4.tcp_keepalive_probes = 5
net.ipv4.tcp_keepalive_intvl = 15
net.ipv4.tcp_max_syn_backlog = 8192
net.ipv4.tcp_window_scaling = 1
net.ipv4.tcp_rmem = 4096 87380 16777216
net.ipv4.tcp_wmem = 4096 65536 16777216

# 🧱 Segurança básica
net.ipv4.icmp_echo_ignore_broadcasts = 1
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.default.rp_filter = 1

# 🛡 Proteção contra spoofing
net.ipv4.conf.all.accept_source_route = 0
net.ipv4.conf.default.accept_source_route = 0

# 🌐 IPv6 (caso não usado)
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
EOF

echo "📂 Ajustando limites do sistema..."

# 3. Aumentar limites de arquivos
cat <<EOF >> /etc/security/limits.conf
* soft nofile 1048576
* hard nofile 1048576
root soft nofile 1048576
root hard nofile 1048576
EOF

# 4. Persistência para systemd
mkdir -p /etc/systemd/system.conf.d/
cat <<EOF > /etc/systemd/system.conf.d/limits.conf
[Manager]
DefaultLimitNOFILE=1048576
EOF

mkdir -p /etc/systemd/user.conf.d/
cat <<EOF > /etc/systemd/user.conf.d/limits.conf
[Manager]
DefaultLimitNOFILE=1048576
EOF

# 5. Ativar as mudanças
echo "🔄 Aplicando parâmetros sysctl..."
sysctl --system

echo "✅ Tuning aplicado com sucesso!"
echo "📌 Recomenda-se reiniciar o sistema para aplicar todos os limites de forma completa."
