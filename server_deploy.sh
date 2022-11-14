#!/bin/sh
set -e

echo "Deploying application ..."

make down_prod

# Update codebase
git fetch origin production
git reset --hard origin/production

make build_prod

# clear cache
docker exec bot_php php bin/console cache:clear
echo "Application deployed!"