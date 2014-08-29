.PHONY: all minscalar prisoners twoatstore ropeintranet filefixit sortedmedian

all: minscalar prisoners twoatstore ropeintranet filefixit sortedmedian

minscalar:
	$(MAKE) -C $@

prisoners:
	$(MAKE) -C $@

twoatstore:
	$(MAKE) -C $@

ropeintranet:
	$(MAKE) -C $@

filefixit:
	$(MAKE) -C $@

sortedmedian:
	$(MAKE) -C $@
