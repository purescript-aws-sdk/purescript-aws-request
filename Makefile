.PHONY: clean init build test release
.DEFAULT_GOAL := build

VERSION_MAJ_MIN := 0.1
VERSION := ${VERSION_MAJ_MIN}.$$((1 + $$(git fetch --tags && git fetch --tags && git tag -l v${VERSION_MAJ_MIN}.[^0] | wc -l)))

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
