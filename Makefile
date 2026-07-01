# Website .typ files: cv.typ, plus any .typ file that imports it
# directly or indirectly. Other .typ files (src/, projects/, etc.)
# are standalone PDFs and are skipped. Cyclical imports would error
# in typst anyway, so no cycle guard is needed here.
TYP_FILES := $(shell bash -c 'cv=$$(realpath cv.typ); pages="$$cv"; changed=1; while [ $$changed -eq 1 ]; do changed=0; for f in $$(find . -name "*.typ" -not -name "_*"); do f=$$(realpath "$$f"); [[ " $$pages " == *" $$f "* ]] && continue; imports=$$(grep -oP "#import\s+\"\K[^\"]+" "$$f" 2>/dev/null | grep -v "^@"); for imp in $$imports; do target=$$(realpath "$$(dirname "$$f")/$$imp" 2>/dev/null); if [[ " $$pages " == *" $$target "* ]]; then pages="$$pages $$f"; changed=1; fi; done; done; done; for p in $$pages; do realpath --relative-to=. "$$p"; done')

# Corresponding .html targets (same path, .typ -> .html)
HTML_FILES := $(TYP_FILES:.typ=.html)

all: html cv.pdf blog/feed.xml

html: $(HTML_FILES)

# Compile any .typ to .html
%.html: %.typ
	typst compile --features html --format html $< $@ --root .


# cv.typ also compiles to pdf
cv.pdf: cv.typ
	typst compile $< $@ --root .

# RSS feed: pulled from <post> metadata tagged inside blog/index.typ via
# `query()`, not from the compiled HTML, so unrelated page content is
# ignored. `typst query` only emits JSON, so the recipe unwraps the
# JSON-quoted string back into raw XML text: strip the surrounding
# quotes, un-escape \" -> ", then let printf %b handle \n \t \r \\ etc.
blog/feed.xml: blog/index.typ
	json="$$(typst query $< "<feed>" --field value --one --root .)"; \
	json="$${json#\"}"; \
	json="$${json%\"}"; \
	json="$$(printf '%s' "$$json" | sed 's/\\"/"/g')"; \
	printf '%b' "$$json" > $@

clean:
	rm -f $(HTML_FILES) cv.pdf blog/feed.xml

.PHONY: all html clean
