.PHONY: all cv index blog clean

all: cv index blog

cv:
	sudo typst c cv.typ cv.pdf

index:
	typst c --features html -f html cv.typ index.html

blog:
	typst c --features html -f html blog/index.typ blog/index.html --root .

clean:
	rm -f cv.pdf index.html blog/index.html
