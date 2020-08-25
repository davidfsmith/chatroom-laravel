
.PHONY: docker_build
docker_build:
	docker-compose build

.PHONY: docker_up
docker_up:
	docker-compose up -d --remove-orphans db app web

.PHONY: docker_down
docker_down:
	docker-compose down

.PHONY: docker_logs
docker_logs:
	docker-compose logs -f

.PHONY: watch
watch:
	docker-compose exec app yarn watch

.PHONY: artisan
artisan:
	docker-compose exec app php artisan $(filter-out $@,$(MAKECMDGOALS))

.PHONY: shell
shell:
	docker-compose exec app bash

.PHONY: psql
psql:
	docker-compose exec db psql -U pguser -d pgdb
