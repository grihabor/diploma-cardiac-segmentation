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
		texlive-latex-extra \
		texlive-fonts-extra \
		dvipng

clean:
	rm -rf $(BUILD_DIR)
