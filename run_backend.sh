#!/usr/bin/env bash
set -e
# Ir al directorio del script (raíz del repo) y luego a backend
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKEND_DIR="${SCRIPT_DIR}/backend"
cd "$BACKEND_DIR" || exit 1
# Asegurar que Python encuentre el módulo "app" (backend/app)
export PYTHONPATH="${BACKEND_DIR}:${PYTHONPATH:-}"
# Render inyecta PORT; no definir PORT en Environment Variables
PORT="${PORT:-10000}"
exec uvicorn app.main:app --host 0.0.0.0 --port "$PORT"
