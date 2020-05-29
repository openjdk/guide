ALL_MD=$(wildcard src/*.md)
ALL_HTML=$(ALL_MD:src/%.md=build/%.html)

.PHONY: all clean

all: build build/guidestyle.css build/devModel.gif $(ALL_HTML)

clean:
	rm -rf build

build:
	mkdir build

build/%.html: src/%.md
	cp src/footer.html build/tmp_footer.html
	perl -pi -e 'BEGIN {$$hash=shift} s/!git-commit-hash!/$$hash/' $$(git log -1 --pretty=format:"%h" -- $<) build/tmp_footer.html
	perl -pi -e 's;!source-file-name!;$<;' build/tmp_footer.html
	pandoc $< --css guidestyle.css --strip-comments --standalone --ascii --to html4 --title-prefix "The OpenJDK Developers' Guide" --include-after-body=build/tmp_footer.html | iconv -f UTF-8 -t ISO-8859-1 > $@
	perl -pi -e 's/ charset=utf-8//' $@
	rm build/tmp_footer.html

build/guidestyle.css: build src/guidestyle.css
	cp src/guidestyle.css build/guidestyle.css

build/devModel.gif: build src/devModel.gif
	cp src/devModel.gif build/devModel.gif
