.PHONY: build lint

build:
	bash myxsu

lint:
	shellcheck -x myxsu
