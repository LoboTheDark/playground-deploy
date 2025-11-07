#!/usr/bin/env bash
set -Eeuo pipefail

cd /opt/playground

# 1) Neueste Images ziehen (nur die, die du updaten willst)
docker compose pull frontend_a frontend_b

# 2) Recreate laufen lassen (Traefik bleibt stehen)
docker compose up -d --remove-orphans

# 3) Aufräumen (optional)
docker image prune -f
