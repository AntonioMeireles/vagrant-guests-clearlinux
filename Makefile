.DEFAULT_GOAL := help

.PHONY: check-version help

PLUGIN := vagrant-guests-clearlinux

help:
	@echo "available 'make' targets:"
	@echo
	@grep -E "^.*:.*?## .*$$" $(MAKEFILE_LIST) | \
		grep -vE "(grep|BEGIN)" | awk \
		'BEGIN {FS = ":.*?## "}; {printf "\t\033[36m%-30s\033[0m %s\n", $$1, $$2}' | \
		VERSION=$(VERSION) envsubst
	@echo

check-version:
ifndef VERSION
	$(error VERSION is undefined)
endif

build: ## builds gem inside a docker container
	docker run -it --rm --name gem-builder -v "$PWD":/usr/src/myapp \
		-w /usr/src/myapp ruby:2.5 bash -c "bundle install; bundle exec rake build"

push: check-version pkg/$(PLUGIN)-${VERSION}.gem ## pushs gem to rubygems.org
	gem push pkg/$(PLUGIN)-${VERSION}.gem

local-install: build check-version ## installs plugin locally for testing
	vagrant plugin uninstall $(PLUGIN)
	vagrant plugin install pkg/$(PLUGIN)-${VERSION}.gem
