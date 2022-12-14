build: _build
up: _up
down: _down
in: _in
fIn: _fIn
run: _run
psr12: _psr12
psr12_fix: _psr12_fix
tests: _tests
build_prod: _build_prod
down_prod: _down_prod

_build:
	docker-compose build && docker-compose up -d && docker exec -it bot_php composer install && docker exec bot_php php bin/console doctrine:migrations:migrate -n --allow-no-migration

_up:
	docker-compose up -d

_down:
	docker-compose down

_in:
	docker exec -it bot_php bash

_fIn:
	docker exec -it sab_frontend bash

_run:
	docker exec -it bot_php bin/console sab:schedule:handle_item $(i)

_psr12:
	docker run --rm -v $(shell pwd):/project registry.rtty.in/web/adp-phpcs:php7.4 phpcs --standard=/project/phpcs.xml -n -p -s --parallel=32

_psr12_fix:
	docker run --rm -v $(shell pwd):/project registry.rtty.in/web/adp-phpcs:php7.4 phpcbf --standard=/project/phpcs.xml -n -p -s --parallel=32

_tests:
	docker exec -it bot_php bin/phpunit

_build_prod:
	docker-compose -f docker-compose.deploy.yml build && docker-compose -f docker-compose.deploy.yml up -d && docker exec bot_php composer install --no-interaction --prefer-dist --optimize-autoloader --no-scripts && docker exec bot_php php bin/console cache:clear && docker exec bot_php php bin/console doctrine:migrations:migrate -n --allow-no-migration

_up_prod:
	docker-compose -f docker-compose.deploy.yml up -d

_down_prod:
	docker-compose -f docker-compose.deploy.yml down

