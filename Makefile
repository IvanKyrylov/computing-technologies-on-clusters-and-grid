# COLORS
GREEN  := $(shell tput -Txterm setaf 2)
RESET  := $(shell tput -Txterm sgr0)

define colored
	@echo '${GREEN}$1${RESET}'
endef

test-all:
	 go test ./... -v -race -coverprofile=$(PWD)/test/coverage.out;\
	 	go tool cover -func $(PWD)/test/coverage.out | grep total

build:
	go build -o bin/grid ./cmd/main.go