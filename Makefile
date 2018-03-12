.PHONY: clean init build test release
.DEFAULT_GOAL := build

VERSION_MAJ_MIN := 0.1
VERSION_PATCH := $(shell git tag -l v${VERSION_MAJ_MIN}.[^0] | wc -l | tr -d '[:space:]')
VERSION := ${VERSION_MAJ_MIN}.$$((${VERSION_PATCH} + 1))

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
	yes c | pulp version ${VERSION}
	yes | pulp publish --no-push
	git push origin --tags
