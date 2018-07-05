.PHONY: clean init build test release
.DEFAULT_GOAL := build

VERSION_MAJ_MIN := 0.4
VERSION_PATCH := $(shell git fetch --tags && git tag -l v${VERSION_MAJ_MIN}.[^0] | wc -l | tr -d '[:space:]')
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
	pulp docs && rm -fr docs && mv generated-docs docs
	[ -z "$$(git status --porcelain)" ] || (echo "Generated content not commited" && exit 1)

release:
	git tag v${VERSION}
	git push origin --tags
