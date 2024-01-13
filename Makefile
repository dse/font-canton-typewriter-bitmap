BDF_SCRIPT := $(HOME)/git/dse.d/perl-font-bdf/bin/bdf
BDF2TTF := $(HOME)/git/dse.d/bitmapfont2ttf/bin/bitmapfont2ttf \
	--monospace --bdf-ascent-descent --remove-line-gap --remove-ascent-add --all-ascent-descent

BDF := dist/bdf/canton-typewriter.bdf
TTF := $(patsubst dist/bdf/%.bdf,dist/ttf/%.ttf,$(BDF))

default: $(BDF) $(TTF)

dist/bdf/%.bdf: src/%.bdf.txt
	mkdir -p dist/bdf
	$(BDF_SCRIPT) "$<" >"$@.tmp"
	mv "$@.tmp" "$@"

dist/ttf/%.ttf: dist/bdf/%.bdf
	mkdir -p dist/ttf
	$(BDF2TTF) "$<" "$@.tmp.ttf"
	mv "$@.tmp.ttf" "$@"

clean:
	find dist/bdf -type f -name '*.bdf' -exec rm {} +
	find dist/ttf -type f -name '*.ttf' -exec rm {} +
