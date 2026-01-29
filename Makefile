.PHONY: all cv html clean

# Find all .typ files containing "cv.with" (not in src/), excluding cv.typ itself
HTML_SOURCES := $(shell grep -l "cv\.with" $$(find . -name '*.typ' ! -path '*/src/*' ! -name 'cv.typ'))
HTML_TARGETS := $(HTML_SOURCES:.typ=.html)

all: clean cv html

cv:
	typst c cv.typ cv.pdf
	typst c --features html -f html cv.typ index.html

html: $(HTML_TARGETS)

%.html: %.typ
	typst c --features html -f html $< $@ --root .

clean:
	rm -f cv.pdf index.html $(HTML_TARGETS)
