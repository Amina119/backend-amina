#!/bin/bash
# GlobeTrotter Backend — update script
# Run as root from ~/backend-amina
# Usage: bash backend-update.sh

set -e

BACKEND_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> Pulling latest backend changes..."
cd "$BACKEND_DIR"
git pull

echo "==> Rebuilding and restarting containers..."
docker compose down
docker compose up -d --build

echo "==> Waiting for containers to start..."
sleep 5

echo "==> Container status:"
docker compose ps

echo ""
echo "✓ Backend updated!"
echo "   Gateway running on 127.0.0.1:5100 (proxied via Nginx /api/)"
