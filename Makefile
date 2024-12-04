# Default target
.DEFAULT_GOAL := help

ERPNEXT_VERSION=healtcare
DOCKER_COMPOSE_FILE=docker-compose.yml
DOCKER_IMAGE_NAME=lilmonk/erpnext:$(ERPNEXT_VERSION)
APP_JSON := apps.json

# Targets
.PHONY: all build up down

.PHONY: build
build:
	@if [ -f $(APP_JSON) ]; then \
		export APPS_JSON_BASE64=$$(base64 -w 0 $(APP_JSON)); \
		docker build -t $(DOCKER_IMAGE_NAME) --build-arg APPS_JSON_BASE64=$$APPS_JSON_BASE64 .; \
	else \
		echo "Error: $(APP_JSON) not found. Ensure the file exists."; \
		exit 1; \
	fi

up:
	docker compose -f $(DOCKER_COMPOSE_FILE) up -d

down:
	docker compose -f $(DOCKER_COMPOSE_FILE) down

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  build: Build the Docker image"
	@echo "  up: Start the Docker containers"
	@echo "  down: Stop the Docker containers"
	@echo "  help: Show this help message"

