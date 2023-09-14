## help: print this help message
.PHONY: help:
	@echo 'Usage:'
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' | sed -e 's/^/ /'

# Create a new confirm target
.PHONY: confirm:
	@echo -n 'Are you sure? [y/N]' && read ans && [ $${ans:-N} = y ]
run/api:
	@go run ./cmd/api


.PHONY: db/migrations/new:
	@echo 'Creating migration files for ${name}...'
	migrate create -seq -ext=.sql -dir=./migrations ${name}

# Use prerequisite: confirm
.PHONY: db/migrations/up: confirm
	@echo 'Running up migrations...'
	migrate -path ./migrations -database "postgres://leandro:123@db/greenlight?sslmode=disable" up 