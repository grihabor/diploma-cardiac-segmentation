BUILD_DIR := $(shell pwd)/build

all: build

build:
	mkdir -p $(BUILD_DIR)
	cd src; pdflatex \
		-interaction=nonstopmode \
		-output-directory $(BUILD_DIR) \
		diploma.tex

install:
	apt update
	apt install -y \
		texlive-latex-recommended \
		texlive-fonts-recommended \
		texlive-lang-cyrillic \
		texlive-latex-extra \
		texlive-fonts-extra

clean:
	rm -rf $(BUILD_DIR)

.PHONY: build install clean
