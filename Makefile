local-dev: ## test application locally
	docker-compose up --build resume_workshop
	@docker-compose run resume_workshop /bin/bash
