.PHONY: all minscalar prisoners twoatstore

all: minscalar prisoners twoatstore

minscalar:
	$(MAKE) -C $@

prisoners:
	$(MAKE) -C $@

twoatstore:
	$(MAKE) -C $@

