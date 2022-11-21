TEX := xelatex
TEXARGS := --synctex=1 --interaction=nonstopmode \
	--shell-escape=1

.PHONY: ins doc tests
all: build ins doc tests

build:
	mkdir -p build

# Installer file
ins: build/oststud.sty build/hsrzf.cls build/hsrbericht.cls build/hsrstud.sty

build/oststud.sty: oststud.ins oststud.dtx
	$(TEX) $(TEXARGS) --output-directory=build $<

build/hsrzf.cls build/hsrbericht.cls build/hsrstud.sty: hsrstud.ins hsrstud-classes.dtx hsrstud.dtx
	$(TEX) $(TEXARGS) --output-directory=build $<


# Documentation for packages
doc: build/oststud.pdf build/hsrstud.pdf build/hsrstud-classes.pdf

build/oststud.pdf: oststud.dtx ins
	$(TEX) $(TEXARGS) --output-directory=build $<
	cd build && \
		makeindex -s gind.ist -o oststud.ind oststud.idx && \
		makeindex -s gglo.ist -o oststud.gls oststud.glo
	$(TEX) $(TEXARGS) --output-directory=build $<
	$(TEX) $(TEXARGS) --output-directory=build $<

build/hsrstud.pdf: hsrstud.dtx ins
	$(TEX) $(TEXARGS) --output-directory=build $<
	cd build && \
		makeindex -s gind.ist -o hsrstud.ind hsrstud.idx && \
		makeindex -s gglo.ist -o hsrstud.gls hsrstud.glo
	$(TEX) $(TEXARGS) --output-directory=build $<
	$(TEX) $(TEXARGS) --output-directory=build $<

build/hsrstud-classes.pdf: hsrstud-classes.dtx ins
	$(TEX) $(TEXARGS) --output-directory=build $<
	cd build && \
		makeindex -s gind.ist -o hsrstud-classes.ind hsrstud-classes.idx && \
		makeindex -s gglo.ist -o hsrstud-classes.gls hsrstud-classes.glo
	$(TEX) $(TEXARGS) --output-directory=build $<
	$(TEX) $(TEXARGS) --output-directory=build $<

tests: build/test/bericht.pdf build/test/zf.pdf

build/test/%.pdf: test/%.tex
	mkdir -p build/test
	$(TEX) $(TEXARGS) --output-directory=build/test $<
