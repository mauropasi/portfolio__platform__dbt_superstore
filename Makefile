.PHONY: help build lint test run docs

help: ## Show available commands
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

lint: ## Run sqlfluff linting across models
	sqlfluff lint models/

run: ## Execute dbt run
	dbt run

test: ## Run dbt data quality tests
	dbt test

build: lint ## Full local build cycle: lint -> run -> test
	dbt build

docs: ## Generate and serve dbt interactive documentation
	dbt docs generate
	dbt docs serve --port 8080
