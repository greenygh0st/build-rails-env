sudo pacman -S base-devel nodejs npm

cd # make sure we are in home

# install rbenv
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
gem install bundler # manages your treasures

# install rails itself
gem install rails
rbenv rehash
