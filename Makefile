build:
	ocamlbuild -use-ocamlfind -plugin-tag 'package(js_of_ocaml.ocamlbuild)' \
		   src/webharness.js
	cp _build/src/webharness.js .

clean:
	ocamlbuild -clean
	rm *.js

.PHONY: build clean
