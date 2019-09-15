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

local-dev: ## Run application locally
	$(MAKE) print-status MSG="Building MIRR Application...hang tight!"
	docker-compose up --build resume_workshop
	#docker-compose run resume_workshop /bin/bash

print-status:
	@:$(call check_defined, MSG, Message to print)
	@echo "$(BLUE)$(MSG)$(NC)"

python: ## set up the python environment
	$(MAKE) print-status MSG="Set up the Python environment"
	LD_LIBRARY_PATH=/usr/local/lib python3 -m venv myvenv
	. myvenv/bin/activate; \
	LD_LIBRARY_PATH=/usr/local/lib python3 -m pip install wheel; \
	LD_LIBRARY_PATH=/usr/local/lib python3 -m pip install -r$(REQS)

test: python ## test the flask app
	$(MAKE) print-status MSG="Test the Flask App"
	python3 -m pytest .
