all: build

build:
	mkdir -p $1
	pdflatex \
		-output-directory $1 \
	src/diploma.tex

install:
	apt update
	apt install -y \
		texlive-latex-recommended \
		texlive-fonts-recommended \
		texlive-latex-extra \
		texlive-fonts-extra \
		dvipng
