BUILD_DIR := $(shell pwd)/build
FLAGS     := -interaction=nonstopmode
LATEX     := latex $(FLAGS)

BRANCH     = $(shell git rev-parse --abbrev-ref HEAD)
DATE       = $(shell date +'%Y-%m-%d_%H•%M•%S')
COMMIT     = $(shell git log --format=%h -1)

all: build

build: clean
	mkdir -p $(BUILD_DIR)
	cp -r src/* build
	cd build; \
		$(LATEX) diploma.tex; \
		bibtex diploma; \
		$(LATEX) diploma.tex; \
		$(LATEX) diploma.tex; \
		dvipdfm diploma.dvi

install:
	apt update
	apt install -y \
		texlive-latex-recommended \
		texlive-fonts-recommended \
		texlive-lang-cyrillic \
		texlive-latex-extra \
		texlive-fonts-extra

clean:
	rm -vrf $(BUILD_DIR)

tag:
	@echo "$(DATE)_$(BRANCH)_$(COMMIT)"

.PHONY: build install clean
