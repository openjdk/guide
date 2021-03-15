default: all
ALL_MD := $(wildcard src/*.md)
ALL_HTML := $(patsubst src/%.md, build/dist/%.html, $(ALL_MD))

MERMAID ?= $(shell command -v mermaid-filter 2> /dev/null)
ifneq ($(MERMAID), )
  MERMAID_FILTER := -F $(MERMAID)
else
  $(info Notice: mermaid is not present; building without diagrams)
  MERMAID_FILTER :=
endif

build/support/footers/%.html: src/%.md
	mkdir -p build/support/footers
	cp src/footer.html $@
	CHANGE_HASH=$$(git log -1 --pretty=format:"%h" -- $<);   \
	if [ "$$CHANGE_HASH" = "" ]; then                        \
	  CHANGE_HASH="0000000";                                 \
	fi;                                                      \
	perl -pi -e 'BEGIN {$$hash=shift} s/!git-commit-hash!/$$hash/' $$CHANGE_HASH $@
	perl -pi -e 's;!source-file-name!;$<;' $@

build/dist/%.html: src/%.md build/support/footers/%.html
	mkdir -p build/dist
	pandoc $< $(MERMAID_FILTER) --css guidestyle.css --strip-comments --standalone --toc --ascii --to html4 --title-prefix "The OpenJDK Developers' Guide" --include-after-body=build/support/footers/$(notdir $@) | iconv -f UTF-8 -t ISO-8859-1 > $@
	perl -pi -e 's/ charset=utf-8//' $@

build/dist/guidestyle.css: src/guidestyle.css
	mkdir -p build/dist
	cp $< $@

all: $(ALL_HTML) build/dist/guidestyle.css

clean:
	rm -rf build

validate: build/index.html
	tidy -q -ascii -asxhtml -n --doctype omit --tidy-mark n build/index.html > /dev/null

.PHONY: default all clean validate
