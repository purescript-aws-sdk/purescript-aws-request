.PHONY: clean init build test release
.DEFAULT_GOAL := build

VERSION ?= patch

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
	git push origin v${VERSION}
