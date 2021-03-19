VER := 4.14.1
PLATFORM := linux
ARCH := amd64

.PHONY: download
download:
	@curl -L https://github.com/golang-migrate/migrate/releases/download/v$(VER)/migrate.$(PLATFORM)-$(ARCH).tar.gz | tar xvz

.PHONY: up
up:
	@docker-compose -f docker-compose.yml --project-directory . up \
		--build --force-recreate --renew-anon-volumes -d
.PHONY: down
down:
	@docker-compose -f docker-compose.yml --project-directory . down

.PHONY: run-tests
run-tests: up
	@./run-in-docker-compose.sh $(RUN)
