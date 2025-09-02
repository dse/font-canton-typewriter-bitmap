default: $(BDFS) $(TTFS)

SRC_BDF := src
SRC_DATA := src
DIST_BDF := dist/bdf
DIST_TTF := dist/ttf

BDF_SCRIPT := $(HOME)/git/dse.d/perl-font-bdf/bin/bdf2bdf --lower-case --swidth-then-dwidth --agl-names
BDF2TTF := $(HOME)/git/dse.d/bitmapfont2ttf/bin/bitmapfont2ttf \
	--monospace --bdf-ascent-descent --remove-line-gap --remove-ascent-add --all-ascent-descent

BDFS := $(DIST_BDF)/canton-typewriter.bdf
TTFS := $(patsubst $(DIST_BDF)/%.bdf,$(DIST_TTF)/%.ttf,$(BDFS))

$(DIST_BDF)/%.bdf: $(SRC_BDF)/%.bdf.txt Makefile
	mkdir -p $(DIST_BDF)
	$(BDF_SCRIPT) "$<" >"$@.tmp"
	mv "$@.tmp" "$@"

$(DIST_TTF)/%.ttf: $(DIST_BDF)/%.bdf Makefile
	mkdir -p $(DIST_TTF)
	$(BDF2TTF) "$<" "$@.tmp.ttf"
	mv "$@.tmp.ttf" "$@"

clean:
	find $(DIST_BDF) -type f -name '*.bdf' -exec rm {} +
	find $(DIST_TTF) -type f -name '*.ttf' -exec rm {} +
