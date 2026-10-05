TARGET ?= dev

.PHONY: help build lint test run docs

help: ## Show available commands
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

lint: ## Run sqlfluff linting across models
	sqlfluff lint models/

run: ## Execute dbt run (Usage: make run [TARGET=dev|prod])
	dbt run --target $(TARGET)

test: ## Run dbt data quality tests (Usage: make test [TARGET=dev|prod])
	dbt test --target $(TARGET)

build: lint ## Full local build cycle: lint -> run -> test (Usage: make build [TARGET=dev|prod])
	dbt build --target $(TARGET)

docs: ## Generate and serve dbt interactive documentation (Usage: make docs [TARGET=dev|prod])
	dbt docs generate --target $(TARGET)
	dbt docs serve --port 8080
