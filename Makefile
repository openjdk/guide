ALL_MD=$(wildcard src/*.md)
ALL_HTML=$(ALL_MD:src/%.md=build/%.html)

.PHONY: all clean

all: build build/guidestyle.css build/devModel.gif $(ALL_HTML)

clean:
	rm -rf build

build:
	mkdir build

build/%.html: src/%.md
	pandoc -o $@ $< --css guidestyle.css --strip-comments --standalone --title-prefix "The OpenJDK Developers' Guide"

build/guidestyle.css: build src/guidestyle.css
	cp src/guidestyle.css build/guidestyle.css

build/devModel.gif: build src/devModel.gif
	cp src/devModel.gif build/devModel.gif
