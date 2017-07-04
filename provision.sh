#!/bin/bash

# Update package list & upgrade packages accordingly.
sudo apt-get -y update
sudo apt-get -y upgrade

# Get "add-apt-repository" Command
sudo apt-get install -y software-properties-common

# Add personal package archive for php. 
sudo add-apt-repository ppa:ondrej/php

sudo apt-get update


# Install apache (not pre-installed on ubuntu/trusty64)
sudo apt-get -y install apache2

# Install php7, php7 mysql bindings and curl.
sudo apt-get -y install php7.0 php7.0-mysql curl

# Install composer
curl -sS https://getcomposer.org/installer | php
# Move phparchive executable to binary folder
sudo mv composer.phar /usr/local/bin/composer

# Install MySql
# debconf keeps all answers to questions packages can ask during installation. We can use it to avoid interactive prompt installs.
# '<<<' Is the 'here string' which explodes and feeds the rhs into the command on the lhs.
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password rootpass'
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password rootpass'

# install mysql, apache database auth module 
sudo apt-get -y install mysql-server libapache2-mod-auth-mysql 

