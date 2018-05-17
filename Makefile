BUILD_DIR := $(shell pwd)/build

BRANCH     = $(shell git rev-parse --abbrev-ref HEAD)
DATE       = $(shell date +'%Y-%m-%d_%H•%M•%S')
COMMIT     = $(shell git log --format=%h -1)

all: build

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)
	cp -r src/* $(BUILD_DIR)
	cp Makefile.build $(BUILD_DIR)/Makefile

.PHONY: build
build: clean $(BUILD_DIR)
	cd $(BUILD_DIR); make diploma.pdf

.PHONY: install
install:
	apt update
	apt install -y \
		texlive-latex-recommended \
		texlive-fonts-recommended \
		texlive-lang-cyrillic \
		texlive-latex-extra \
		texlive-fonts-extra \
		latexmk
		
.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)

.PHONY: tag
tag:
	@echo "$(DATE)_$(BRANCH)_$(COMMIT)"

