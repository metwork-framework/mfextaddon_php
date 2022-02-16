include ../../../adm/root.mk
include $(MFEXT_HOME)/share/package.mk

export NAME=getcomposer
export VERSION=2.2.6
export CHECKTYPE=MD5
export CHECKSUM=80550f2491ac27472a929e9cc8740f79

DESCRIPTION=\
Composer is a tool for dependency management in PHP.
WEBSITE=https://getcomposer.org/
LICENSE=MIT license

all:: $(PREFIX)/bin/composer
$(PREFIX)/bin/composer:
	$(MAKE) --file=$(MFEXT_HOME)/share/Makefile.standard PREFIX=$(PREFIX) download
	cp build/$(NAME)-$(VERSION) $(PREFIX)/bin/composer	
	chmod +x $(PREFIX)/bin/composer
