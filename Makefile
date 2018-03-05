.PHONY: clean build release test

VERSION := 0.0.$(shell git log --oneline | wc -l | tr -d '[:space:]')

clean:
	rm -fr bower_components node_modules output

build:
	npm update
	bower update
	pulp build

test:
	pulp test

release:
	pulp version ${VERSION}
	pulp publish
