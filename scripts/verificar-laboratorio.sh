#!/usr/bin/env bash
set -u

echo "===== VERIFICACAO DO LABORATORIO ====="
echo
echo "[Sistema]"
uname -a
echo
echo "[Usuario]"
id
echo
echo "[Apache2]"
if command -v systemctl >/dev/null 2>&1; then
  systemctl is-active apache2 2>/dev/null || true
  echo
  echo "[MariaDB]"
  systemctl is-active mariadb 2>/dev/null || true
fi
echo
echo "[PHP]"
if command -v php >/dev/null 2>&1; then
  php -v | head -n 1
  echo
  echo "[Extensoes relevantes]"
  php -m | grep -Ei 'mysqli|pdo_mysql|gd|xml|mbstring|curl|zip|bcmath' || true
else
  echo "PHP nao encontrado"
fi
echo
echo "[Git]"
git --version 2>/dev/null || true
echo
echo "===== FIM ====="
