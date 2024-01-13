BDF_SCRIPT := $(HOME)/git/dse.d/perl-font-bdf/bin/bdf

BDF := dist/bdf/canton-typewriter.bdf

default: $(BDF)

dist/bdf/%.bdf: src/%.bdf.txt
	mkdir -p dist/bdf
	$(BDF_SCRIPT) "$<" >"$@.tmp"
	mv "$@.tmp" "$@"

clean:
	find dist/bdf -type f -name '*.bdf' -exec rm {} +
