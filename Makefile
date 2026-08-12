# Website .typ files: cv.typ, plus any .typ file that imports it
# directly or indirectly. Other .typ files (src/, projects/, etc.)
# are standalone PDFs and are skipped. Cyclical imports would error
# in typst anyway, so no cycle guard is needed here.
TYP_FILES := $(shell bash -c 'cv=$$(realpath cv.typ); pages="$$cv"; changed=1; while [ $$changed -eq 1 ]; do changed=0; for f in $$(find . -name "*.typ" -not -name "_*"); do f=$$(realpath "$$f"); [[ " $$pages " == *" $$f "* ]] && continue; imports=$$(grep -oP "#import\s+\"\K[^\"]+" "$$f" 2>/dev/null | grep -v "^@"); for imp in $$imports; do target=$$(realpath "$$(dirname "$$f")/$$imp" 2>/dev/null); if [[ " $$pages " == *" $$target "* ]]; then pages="$$pages $$f"; changed=1; fi; done; done; done; for p in $$pages; do realpath --relative-to=. "$$p"; done')
# Corresponding .html targets (same path, .typ -> .html)
HTML_FILES := $(TYP_FILES:.typ=.html)

# Any TYP_FILES entry that emits a <feed> metadata tag gets its own
# feed.xml, written alongside it (dir/feed.xml, not dir/basename.xml --
# base-url in each file already points at "<its dir>/feed.xml").
FEED_TYP_FILES := $(shell for f in $(TYP_FILES); do grep -ql '<feed>' "$$f" 2>/dev/null && echo "$$f"; done)
FEED_XML_FILES := $(foreach f,$(FEED_TYP_FILES),$(dir $(f))feed.xml)

all: html cv.pdf $(FEED_XML_FILES)
html: $(HTML_FILES)
# Compile any .typ to .html
%.html: %.typ
	typst compile --features html --format html $< $@ --root .
# cv.typ also compiles to pdf
cv.pdf: cv.typ
	typst compile $< $@ --root .
	typst compile --features html --format html $< index.html --root .

# Generate one rule per feed source: dir/feed.xml <- dir/source.typ.
# `typst query` only emits JSON, so unwrap the JSON-quoted string back
# into raw XML: strip surrounding quotes, un-escape \" -> ", then let
# printf %b handle \n \t \r \\ etc.
define FEED_RULE
$(dir $(1))feed.xml: $(1)
	json="$$$$(typst eval 'query(<feed>).first().value' --root . --in $$<)"; \
	json="$$$${json#\"}"; \
	json="$$$${json%\"}"; \
	json="$$$$(printf '%s' "$$$$json" | sed 's/\\"/"/g')"; \
	printf '%b' "$$$$json" > $$@
endef
$(foreach f,$(FEED_TYP_FILES),$(eval $(call FEED_RULE,$(f))))
clean:
	rm -f $(HTML_FILES) cv.pdf $(FEED_XML_FILES)
.PHONY: all html clean
