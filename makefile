TEX := xelatex -shell-escape

.PHONY: all clean test
all: hsrstud.sty hsrstud.pdf hsrzf.cls hsrbericht.cls hsrstud-classes.pdf test
test: test/zf.pdf test/bericht.pdf
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
		test/bericht.aux \
		test/bericht.fdb_latexmk \
		test/bericht.fls \
		test/bericht.log \
		test/bericht.out \
		test/bericht.xdv \
		test/zf.aux \
		test/zf.fdb_latexmk \
		test/zf.fls \
		test/zf.log \
		test/zf.out \
		test/zf.pdf \
		test/zf.xdv \
		missfont.log \
        2> /dev/null; true

hsrstud.sty hsrzf.cls hsrbericht.cls: hsrstud.ins hsrstud.dtx hsrstud-classes.dtx
	$(TEX) hsrstud.ins

hsrstud.pdf: hsrstud.dtx
	$(TEX) $<

hsrstud-classes.pdf: hsrstud-classes.dtx
	$(TEX) $<

test/%.pdf: test/%.tex hsrstud.sty hsrzf.cls hsrbericht.cls
	cd test && $(TEX) $(patsubst test/%.tex,%,$<)

# vim: noet :
