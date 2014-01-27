.PHONY: all

all: prisoners.native prisoners

prisoners.native: prisoners.ml
	ocamlbuild $@

prisoners: prisoners.cpp
	g++ -O2 -o $@ $^
