TEX := xelatex -shell-escape

.PHONY: all clean
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
        2> /dev/null; true

hsrstud.sty hsrzf.cls hsrbericht.cls: hsrstud.ins hsrstud.dtx hsrstud-classes.dtx
	$(TEX) hsrstud.ins

hsrstud.pdf: hsrstud.dtx
	$(TEX) $<

hsrstud-classes.pdf: hsrstud-classes.dtx
	$(TEX) $<
