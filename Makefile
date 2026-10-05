# Same tools and flags as the nvim setup: shellcheck, and shfmt with -ci -sr
SCRIPTS = myxsu urls

.PHONY: build lint fmt fmt-check

build:
	bash myxsu

lint:
	shellcheck -x $(SCRIPTS)

fmt:
	shfmt -w -ci -sr $(SCRIPTS)

fmt-check:
	shfmt -d -ci -sr $(SCRIPTS)
