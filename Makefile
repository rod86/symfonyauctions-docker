PHP=docker-compose exec php
SYMFONY=$(PHP) bin/console

.PHONY: help
help: ## List all available Makefile commands
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z\/_-]+:.*?##/ { printf " \033[36m%-10s\033[90m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%/s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

# DOCKER

.PHONY: build up stop bash
build: ## Build docker containers
	@docker-compose build

up: ## Start docker containers
	@docker-compose up -d

stop: ## Stop docker container
	@docker-compose stop

bash: ## Go into docker service shell. Usage: make bash s=php
	@docker-compose exec $(s) bash

# PROJECT

.PHONY: install autoload

install: ## install composer dependencies
	@$(PHP) composer install

autoload: ## Regenerate composer autoload file
	@$(PHP) composer dump-autoload

# DATABASE

.PHONY: database database/create database/migrate database/seed

database: database/create database/migrate database/seed
	
database/create: ## Create (drop if exists before) database
	@$(SYMFONY) doctrine:database:drop --if-exists --force
	@$(SYMFONY) doctrine:database:create --if-not-exists
	@docker-compose exec mariadb bash -c "mysql -uroot -proot symfonyauctionsdb < /var/www/database/functions.sql"

database/migrate: ## Run migrations
	@$(SYMFONY) doctrine:migrations:migrate --no-interaction

database/seed: ## Seed database 
	@$(SYMFONY) doctrine:fixtures:load --no-interaction
	