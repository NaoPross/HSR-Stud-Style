TEX := xelatex -shell-escape

.PHONY: all test clean
all: hsrstud.sty hsrstud.pdf hsrzf.cls hsrbericht.cls hsrstud-classes.pdf
clean:
	@rm -v \
		hsrbericht.cls \
		hsrstud.aux \
		hsrstud-classes.aux \
		hsrstud-classes.fdb_latexmk \
		hsrstud-classes.fls \
		hsrstud-classes.log \
		hsrstud-classes.out \
		hsrstud-classes.pdf \
		hsrstud-classes.toc \
		hsrstud.dvi \
		hsrstud.fdb_latexmk \
		hsrstud.fls \
		hsrstud.glo \
		hsrstud.idx \
		hsrstud.ilg \
		hsrstud.ind \
		hsrstud.log \
		hsrstud.out \
		hsrstud.pdf \
		hsrstud.sty \
		hsrstud.toc \
		hsrstud.vrb \
		hsrzf.cls \
		testbericht.aux \
		testbericht.fdb_latexmk \
		testbericht.fls \
		testbericht.log \
		testbericht.out \
		testbericht.xdv \
		testzf.aux \
		testzf.fdb_latexmk \
		testzf.fls \
		testzf.log \
		testzf.out \
		testzf.pdf \
		testzf.xdv \
		missfont.log \
        2> /dev/null; true

hsrstud.sty hsrzf.cls hsrbericht.cls: hsrstud.ins hsrstud.dtx hsrstud-classes.dtx
	$(TEX) hsrstud.ins

hsrstud.pdf: hsrstud.dtx
	$(TEX) $<

hsrstud-classes.pdf: hsrstud-classes.dtx
	$(TEX) $<

test: hsrstud.sty hsrzf.cls hsrbericht.cls
	$(TEX) testzf.tex
	$(TEX) testbericht.tex

# vim: noet :
