.PHONY: all minscalar prisoners twoatstore ropeintranet

all: minscalar prisoners twoatstore ropeintranet

minscalar:
	$(MAKE) -C $@

prisoners:
	$(MAKE) -C $@

twoatstore:
	$(MAKE) -C $@

ropeintranet:
	$(MAKE) -C $@
