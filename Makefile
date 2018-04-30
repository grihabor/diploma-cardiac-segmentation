BUILD_DIR := build

all: build

build:
	mkdir -p $(BUILD_DIR)
	pdflatex \
		-output-directory $(BUILD_DIR) \
		src/diploma.tex

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
