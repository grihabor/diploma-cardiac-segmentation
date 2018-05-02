BUILD_DIR := $(shell pwd)/build
FLAGS     := -interaction=nonstopmode
LATEX     := latex $(FLAGS)


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

.PHONY: build install clean
