BDF_SCRIPT := $(HOME)/git/dse.d/perl-font-bdf/bin/bdf

BDF := dist/bdf/canton-typewriter.bdf

default: $(BDF)

dist/bdf/%.bdf: src/%.bdf.txt
	mkdir -p dist/bdf
	$(BDF_SCRIPT) "$<" >"$@.tmp"
	mv "$@.tmp" "$@"
