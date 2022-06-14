PHP=docker-compose exec php
SYMFONY=$(PHP) bin/console

.PHONY: help build up stop bash install autoload database migrate

help: ## List all available Makefile commands
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

build: ## Build docker containers
	@docker-compose build

up: ## Start docker containers
	@docker-compose up -d

stop: ## Stop docker container
	@docker-compose stop

bash: ## Go into docker service shell. Usage: make bash s=php
	@docker-compose exec $(s) bash
	
install: ## install composer dependencies
	@$(PHP) composer install

autoload: ## Regenerate composer autoload file
	@$(PHP) composer dump-autoload

database: ## Reset database
	@$(SYMFONY) doctrine:database:drop --if-exists --force
	@$(SYMFONY) doctrine:database:create --if-not-exists
	@docker-compose exec mariadb bash -c "mysql -uroot -proot symfonyauctionsdb < /var/www/database/functions.sql"

migrate: ## Run migrations
	@$(SYMFONY) doctrine:migrations:migrate --no-interaction