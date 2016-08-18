#!/bin/bash

if [ $UID != 0]
then
  echo "Please run this script with sudo. It won't make the sandwich otherwise."
  echo "sudo $0 $*"
  exit 1
fi

xcode-select --install
gcc --version

#install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
which brew

#install rbenv
brew update
brew install rbenv ruby-build
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

#install ruby
rbenv install -v 2.3.1
rbenv global 2.3.1

#install Git from brew
#brew install git

ruby -v

echo "gem: --no-document" > ~/.gemrc

gem install bundler
gem install rails
rbenv rehash

rails -v
