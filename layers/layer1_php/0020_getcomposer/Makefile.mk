include ../../../adm/root.mk
include $(MFEXT_HOME)/share/package.mk

export NAME=getcomposer
export VERSION=2.3.7
export CHECKTYPE=MD5
export CHECKSUM=6236729103b978f8d43fa854787346ab

DESCRIPTION=\
Composer is a tool for dependency management in PHP.
WEBSITE=https://getcomposer.org/
LICENSE=MIT license

all:: $(PREFIX)/bin/composer
$(PREFIX)/bin/composer:
	$(MAKE) --file=$(MFEXT_HOME)/share/Makefile.standard PREFIX=$(PREFIX) download
	cp build/$(NAME)-$(VERSION) $(PREFIX)/bin/composer	
	chmod +x $(PREFIX)/bin/composer
