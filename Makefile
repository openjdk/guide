ALL_MD=$(wildcard src/*.md)
ALL_HTML=$(ALL_MD:src/%.md=build/%.html)

MERMAID ?= $(shell command -v mermaid-filter 2> /dev/null)
ifneq ($(MERMAID), )
  MERMAID_FILTER := -F $(MERMAID)
else
  $(info Notice: mermaid is not present; building without diagrams)
  MERMAID_FILTER :=
endif

.PHONY: all clean

all: build build/guidestyle.css $(ALL_HTML)

clean:
	rm -rf build

build:
	mkdir build

build/%.html: src/%.md src/footer.html
	cp src/footer.html build/tmp_footer.html
	CHANGE_HASH=$$(git log -1 --pretty=format:"%h" -- $<);   \
	if [ "$$CHANGE_HASH" = "" ]; then                        \
	  CHANGE_HASH="0000000";                                 \
	fi;                                                      \
	perl -pi -e 'BEGIN {$$hash=shift} s/!git-commit-hash!/$$hash/' $$CHANGE_HASH build/tmp_footer.html
	perl -pi -e 's;!source-file-name!;$<;' build/tmp_footer.html
	pandoc $< $(MERMAID_FILTER) --css guidestyle.css --strip-comments --standalone --toc --ascii --to html4 --title-prefix "The OpenJDK Developers' Guide" --include-after-body=build/tmp_footer.html | iconv -f UTF-8 -t ISO-8859-1 > $@
	perl -pi -e 's/ charset=utf-8//' $@
	rm build/tmp_footer.html

build/guidestyle.css: build src/guidestyle.css
	cp src/guidestyle.css build/guidestyle.css

validate: build/index.html
	tidy -q -ascii -asxhtml -n --doctype omit --tidy-mark n build/index.html > /dev/null
