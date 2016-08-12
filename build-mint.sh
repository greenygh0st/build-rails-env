#!/bin/bash

if [ $UID != 0]
then
  echo "Please run this script with sudo. It won't make the sandwich otherwise."
  echo "sudo $0 $*"
  exit 1
fi



sudo apt-get update
sudo apt-get install nodejs
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

#install atom
wget https://atom.io/download/deb
sudo dpkg -i ./atom-amd64.deb

cd
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

rbenv install -v 2.3.1
rbenv global 2.3.1

ruby -v

echo "gem: --no-document" > ~/.gemrc

gem install bundler

gem install rails

rbenv rehash

rails -v

echo 'Congrats! Rails and all the junk it needs is installed.'
