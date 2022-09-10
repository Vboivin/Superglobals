#!/bin/bash
set -ex
sudo apt-get update -y
DEBIAN_FRONTEND=noninteractive sudo apt-get install -y php-cli zip unzip
hhvm --version
php --version
(
    cd $(mktemp -d)
    curl https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
)
composer install
vendor/bin/hacktest tests/
vendor/bin/hhast-lint
