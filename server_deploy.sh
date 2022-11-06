#!/bin/sh
set -e

echo "Deploying application ..."

make down_prod

# Update codebase
git fetch origin deploy
git reset --hard origin/deploy

make build_prod

# Install dependencies based on lock file

composer install --no-interaction --prefer-dist --optimize-autoloader

# Migrate database
#    php bin/console d:m:m

# clear cache
php bin/console cache:clear

#Npm job
#npm install
#npm run production
make in && composer install --no-interaction --prefer-dist --optimize-autoloader && php bin/console cache:clear
echo "Application deployed!"