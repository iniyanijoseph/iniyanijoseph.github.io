# Find all .typ files (recursively), excluding any whose filename starts with _
TYP_FILES := $(shell find . -name '*.typ' -not -name '_*')

# Corresponding .html targets (same path, .typ -> .html)
HTML_FILES := $(TYP_FILES:.typ=.html)

all: html cv.pdf

html: $(HTML_FILES)

# Compile any .typ to .html
%.html: %.typ
	typst compile --features html --format html $< $@ --root .

# cv.typ also compiles to pdf
cv.pdf: cv.typ
	typst compile $< $@ --root .

clean:
	rm -f $(HTML_FILES) cv.pdf

.PHONY: all html clean
