default: all

define NEWLINE


endef

TITLE := The OpenJDK Developers' Guide

ALL_MD := $(wildcard src/*.md)
ALL_FOOTER := $(patsubst src/%.md, build/support/footers/%.html, $(ALL_MD))
ALL_RESULT := $(patsubst src/%.md, build/dist/%.html, $(ALL_MD))

UTF8_HTML := $(patsubst build/dist/%.html, build/support/utf-8/%.html, $(ALL_RESULT))

ifneq ($(DEBUG_MAKE),)
  .SECONDARY: $(ALL_FOOTER) $(UTF8_HTML)
endif

MERMAID ?= $(shell command -v mermaid-filter 2> /dev/null)
ifneq ($(MERMAID), )
  MERMAID_FILTER := -F $(MERMAID)
else
  $(info Notice: mermaid is not present; building without diagrams)
  MERMAID_FILTER :=
endif

# Return the short form git hash for the last change to a file or set of files
# $1: the name of the file or files to get the hash for
GetHash = \
	$(eval _shell_hash = $(shell git log -1 --pretty=format:"%h" -- $1)) \
	$(if $(_shell_hash), \
	$(_shell_hash), \
	0000000)

# Generate a footer from the tempate in src/footer.html
# $1: output file name
# $2: git hash value
# $3: relative file name
GenerateFooter = \
	sed -e 's@!git-commit-hash!@$(strip $2)@' -e 's@!source-file-name!@$(strip $3)@' src/footer.html > $1

# Convert markdown to html by pandoc
# $1: input markdown file
# $2: output html file
RunPandoc = \
	pandoc $1 $(MERMAID_FILTER) --css guidestyle.css --strip-comments --standalone --toc --ascii --to html4 --title-prefix "$(TITLE)" --include-after-body=build/support/footers/$(notdir $2) > $2

# Convert utf-8 html to latin-1
# $1: input utf-8 file
# $2: output latin-1 file
ConvertToLatin1 = \
	sed -e 's/ charset=utf-8//' $1 | iconv -f UTF-8 -t ISO-8859-1 > $2

build/support/footers/%.html: src/%.md
	mkdir -p build/support/footers
	$(call GenerateFooter, $@, $(call GetHash, $<), $<)

build/support/utf-8/%.html: src/%.md build/support/footers/%.html
	mkdir -p build/support/utf-8
	$(call RunPandoc, $<, $@)

build/dist/%.html: build/support/utf-8/%.html
	mkdir -p build/dist
	$(call ConvertToLatin1, $<, $@)

build/dist/guidestyle.css: src/guidestyle.css
	mkdir -p build/dist
	cp $< $@

all: $(ALL_RESULT) build/dist/guidestyle.css

clean:
	rm -rf build

validate: build/dist/index.html
	tidy -q -ascii -asxhtml -n --doctype omit --tidy-mark n build/dist/index.html > /dev/null

.PHONY: default all clean validate
