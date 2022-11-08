#!/bin/sh
set -e

echo "Deploying application ..."

make down_prod

# Update codebase
git fetch origin deploy
git reset --hard origin/deploy

make build_prod

# clear cache
docker exec bot_php php bin/console cache:clear
echo "Application deployed!"