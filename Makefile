.PHONY: build release test

VERSION := 0.0.$(shell git log --oneline | wc -l | tr -d '[:space:]')

build:
	npm update
	bower update
	pulp build

test:
	pulp test

release:
	pulp version ${VERSION}
	yes | pulp publish
