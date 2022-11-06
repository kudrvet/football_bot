#!/bin/sh
set -e

echo "Deploying application ..."

make down_prod

# Update codebase
git fetch origin deploy
git reset --hard origin/deploy

make build_prod

echo "Application deployed!"