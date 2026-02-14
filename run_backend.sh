#!/usr/bin/env bash
set -e
# Ir al directorio del script (raíz del repo) y luego a backend
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKEND_DIR="${SCRIPT_DIR}/backend"
cd "$BACKEND_DIR" || exit 1
# Asegurar que Python encuentre el módulo "app"
export PYTHONPATH="${BACKEND_DIR}:${PYTHONPATH:-}"
PORT="${PORT:-10000}"
# python -m para que use el intérprete con PYTHONPATH correcto
exec python -m uvicorn app.main:app --host 0.0.0.0 --port "$PORT"
