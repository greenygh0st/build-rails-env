#!/bin/bash
#
# https://gorails.com/setup/osx/10.11-el-capitan

xcode-select --install
gcc --version

#install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
which brew

brew install rbenv ruby-build

# Add rbenv to bash so that it loads every time you open a terminal
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
source ~/.bash_profile

# Install Ruby
rbenv install 2.3.1
rbenv global 2.3.1
ruby -v

echo "gem: --no-document" > ~/.gemrc

gem install bundler
gem install rails
rbenv rehash

rails -v
