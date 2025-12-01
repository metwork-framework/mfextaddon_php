include ../../../adm/root.mk
include $(MFEXT_HOME)/share/package.mk

export NAME=php
export VERSION=8.1.33
export EXTENSION=tar.xz
export CHECKTYPE=MD5
export CHECKSUM=36cd5b20659667cbddd171c6238dd64b

DESCRIPTION=\
PHP is a popular general-purpose scripting language that is especially suited to web development
WEBSITE=https://www.php.net/
LICENSE=PHP license (BSD-style license without "copyleft" restrictions associated with GPL)

all:: $(PREFIX)/bin/php
$(PREFIX)/bin/php:
	$(MAKE) --file=$(MFEXT_HOME)/share/Makefile.standard PREFIX=$(PREFIX) OPTIONS="--with-curl --with-readline=$(PREFIX)/../core --with-openssl --with-pgsql=$(PREFIX)/../scientific_core --enable-fpm --enable-cgi -enable-mbstring --with-ldap=$(PREFIX)/../core --with-zlib --with-zip --enable-gd --enable-soap --with-pdo-pgsql=$(PREFIX)/../scientific_core --with-mysqli --with-pdo-mysql" download uncompress configure build install

	# init config files
	cp ./build/php-$(VERSION)/php.ini-development $(PREFIX)/lib/php.ini
	mv $(PREFIX)/etc/php-fpm.conf.default $(PREFIX)/etc/php-fpm.conf
	mv $(PREFIX)/etc/php-fpm.d/www.conf.default $(PREFIX)/etc/php-fpm.d/www.conf

	# configure php-fpm
	sed -i 's/^user = nobody/;user = nobody/g' $(PREFIX)/etc/php-fpm.d/www.conf
	sed -i 's/^group = nobody/;group = nobody/g' $(PREFIX)/etc/php-fpm.d/www.conf
	sed -i 's/^listen = .*/listen = {{PHP_SOCKET_PATH}}/g' $(PREFIX)/etc/php-fpm.d/www.conf
	sed -i 's/^;listen.owner = .*/listen.owner = {{MFMODULE_RUNTIME_USER}}/g' $(PREFIX)/etc/php-fpm.d/www.conf
	sed -i 's/^;listen.group = .*/listen.group = {{MFMODULE_RUNTIME_GROUP}}/g' $(PREFIX)/etc/php-fpm.d/www.conf
	sed -i 's/^;listen.mode = .*/listen.mode = 0660/g' $(PREFIX)/etc/php-fpm.d/www.conf
	sed -i 's/^;clear_env = no/clear_env = no/g' $(PREFIX)/etc/php-fpm.d/www.conf
	sed -i 's/%{%Y-%m-%dT%H:%M:%S%z}/{% raw %}%{%Y-%m-%dT%H:%M:%S%z}{% endraw %}/g' $(PREFIX)/etc/php-fpm.d/www.conf
	sed -i 's/^;error_log = .*/error_log = {{PHP_LOGFILE_PATH}}/g' $(PREFIX)/etc/php-fpm.conf
	sed -i 's/^include=.*/include = {{WWWCONF}}/g' $(PREFIX)/etc/php-fpm.conf
