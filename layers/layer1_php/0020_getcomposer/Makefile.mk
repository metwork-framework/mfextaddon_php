include ../../../adm/root.mk
include $(MFEXT_HOME)/share/package.mk

export NAME=getcomposer
export VERSION=2.5.1
export CHECKTYPE=MD5
export CHECKSUM=90709ebe7b0b035e8bc653b37d409535

DESCRIPTION=\
Composer is a tool for dependency management in PHP.
WEBSITE=https://getcomposer.org/
LICENSE=MIT license

all:: $(PREFIX)/bin/composer
$(PREFIX)/bin/composer:
	$(MAKE) --file=$(MFEXT_HOME)/share/Makefile.standard PREFIX=$(PREFIX) download
	cp build/$(NAME)-$(VERSION) $(PREFIX)/bin/composer	
	chmod +x $(PREFIX)/bin/composer
