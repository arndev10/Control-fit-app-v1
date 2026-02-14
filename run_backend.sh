#!/usr/bin/env bash
set -e
cd backend || exit 1
# Render inyecta PORT; no definir PORT en Environment Variables
PORT="${PORT:-10000}"
exec uvicorn app.main:app --host 0.0.0.0 --port "$PORT"
