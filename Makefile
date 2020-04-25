.PHONY: docker docs test
REQS := requirements.txt
# Used for colorizing output of echo messages
BLUE := "\\033[1\;36m"
NC := "\\033[0m" # No color/default

define PRINT_HELP_PYSCRIPT
import re, sys

for line in sys.stdin:
  match = re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$', line)
  if match:
    target, help = match.groups()
    print("%-20s %s" % (target, help))
endef

export PRINT_HELP_PYSCRIPT

help: 
	@python -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)

clean: ## Cleanup all the things
	rm -rf .tox
	rm -rf venv
	rm -rf .pytest_cache
	rm -rf .coverage
	rm -rf *.egg-info
	rm -rf build
	rm -rf dist
	rm -rf htmlcov
	find . -name '*.pyc' | xargs rm -rf
	find . -name '__pycache__' | xargs rm -rf

dev: python ## build docker container for testing
	$(MAKE) print-status MSG="Building with docker-compose"
	@if [ -f /.dockerenv ]; then $(MAKE) print-status MSG="***> Don't run make dev inside docker container <***" && exit 1; fi
	docker-compose -f docker/docker-compose.yml build resume_workshop
	@docker-compose -f docker/docker-compose.yml run resume_workshop /bin/bash

docs: python ## Generate documentation
	#sphinx-quickstart
	cd docs && make html

docker: ## Run application locally
	@if [ -f /.dockerenv ]; then $(MAKE) print-status MSG="***> Don't run make docker inside docker container <***" && exit 1; fi
	$(MAKE) print-status MSG="Building MIRR Application...hang tight!"
	docker-compose -f docker/docker-compose.yml up --build resume_workshop

print-status:
	@:$(call check_defined, MSG, Message to print)
	@echo "$(BLUE)$(MSG)$(NC)"

python: ## set up the python environment
	$(MAKE) print-status MSG="Set up the Python environment"
	if [ -f 'requirements.txt' ]; then pip3 install -rrequirements.txt; fi

test: python ## test the flask app
	$(MAKE) print-status MSG="Test the Flask App"
	if [ -f 'test/requirements-test.txt' ]; then pip3 install -rtest/requirements-test.txt; fi
	python3 -m pytest .
