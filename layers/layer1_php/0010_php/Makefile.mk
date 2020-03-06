include ../../../adm/root.mk
include $(MFEXT_HOME)/share/package.mk

export NAME=php
export VERSION=7.4.3
export EXTENSION=tar.xz
export CHECKTYPE=MD5
export CHECKSUM=853df4727b2dcde52e9cc9d944f87498
DESCRIPTION=\
PHP is a popular general-purpose scripting language that is especially suited to web development
WEBSITE=https://www.php.net/
LICENSE=PHP license (BSD-style license without "copyleft" restrictions associated with GPL)

all:: $(PREFIX)/bin/php
$(PREFIX)/bin/php:
	$(MAKE) --file=$(MFEXT_HOME)/share/Makefile.standard PREFIX=$(PREFIX) OPTIONS="--with-curl --with-readline=$(PREFIX)/../core --with-openssl --with-pgsql=$(PREFIX)/../scientific_core --enable-fpm --enable-cgi" download uncompress configure build install
