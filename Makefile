USER = "$(shell id -u):$(shell id -g)"

app-up:
	docker-compose up

app-build:
	docker-compose build

app-bash:
	docker-compose run app bash

app-install:
	docker-compose run app bundle install

app-setup: app-build app-install app-db-prepare

app-db-prepare:
	docker-compose run app bash -c "bin/rails db:create db:migrate"

test:
	docker-compose run app bin/rails test
