#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

if [[ ! -x ./analyzer ]]; then
  echo "[INFO] Compilando binario..."
  make
fi

run_test() {
  local input="$1"
  local esperado="$2"

  output=$(echo -e "$input" | qemu-aarch64 -L /usr/aarch64-linux-gnu ./analyzer)

  if [[ "$output" == "$esperado" ]]; then
    echo "[OK]"
  else
    echo "[FAIL]"
    echo "Esperado: $esperado"
    echo "Obtenido: $output"
  fi
}

echo "=============================="
echo " PRUEBAS VARIANTE C (HTTP 503)"
echo "=============================="

echo "[TEST 1]"
run_test "200\n503\n404" "Se encontro el primer 503"

echo "[TEST 2]"
run_test "200\n404\n500" "No se encontro ningun 503"

echo "=============================="
