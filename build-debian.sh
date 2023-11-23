#!/bin/bash

if [ $UID != 0]
then
  echo "Please run this script with sudo. It won't make the sandwich otherwise."
  echo "sudo $0 $*"
  exit 1
fi

sudo apt-get update

sudo apt-get install wget git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev postgresql-client libmagickwand-dev imagemagick

cd #make sure we are in your home directory

#install rbenv
git clone https://github.com/rbenv/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile

#install ruby
rbenv install -v 3.2.2
rbenv global 3.2.2
echo "gem: --no-document" > ~/.gemrc #keep loads of un-needed documentation from being installed
gem install bundler #manages your treasures

#install rails itself
gem install rails
rbenv rehash

sudo apt-get update
sudo apt-get install nodejs

rails -v

echo 'Congrats! Rails and all the junk it needs is installed.'
