#!/usr/bin/env bash
set -u

echo "===== INVENTARIO LOCAL DE REDE ====="
echo
echo "[Interfaces e enderecos]"
ip -brief address 2>/dev/null || ip addr
echo
echo "[Rotas]"
ip route 2>/dev/null || true
echo
echo "Use estes dados para documentar a topologia da sua rede privada de laboratorio."
echo "Este script nao realiza varredura nem testa outros hosts."
echo "===== FIM ====="
