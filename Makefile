.PHONY: clean init build test release
.DEFAULT_GOAL := build

VERSION := 0.0.$(shell git log --oneline | wc -l | tr -d '[:space:]')

clean:
	rm -fr bower_components node_modules output

init:
	npm update
	bower update

build:
	pulp build

test:
	pulp test

release:
	pulp version ${VERSION}
	yes | pulp publish --no-push
	git push origin --tags
