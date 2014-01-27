.PHONY: all minscalar prisoners twoatstore ropeintranet filefixit

all: minscalar prisoners twoatstore ropeintranet filefixit

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
