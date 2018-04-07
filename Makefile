# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

up: ## Spin up services
	sudo sysctl -w vm.max_map_count=262144
	docker-compose up -d
	
stop: ## Stop running services
	docker-compose stop

start: ## Start stopped services
	docker-compose start

rm: ## Stop and remove running services and volumes
	sudo sed -i '/elasticsearch.local/d' /etc/hosts
	docker-compose down -v

restart: ## Restart service
	docker-compose restart $(SERVICE_NAME)

hostname: ## Set elasticsearch.local in /etc/hosts
	sudo sed -i '/elasticsearch.local/d' /etc/hosts
	echo $(shell docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' haproxy) elasticsearch.local | sudo tee -a /etc/hosts
