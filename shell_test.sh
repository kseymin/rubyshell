#!/bin/bash
set -e

# ./2.sh
cd ~

# Install some dependencies for Ruby
sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev nodejs

# Install rbenv and ruby-build plugins
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc


# ruby install

sudo rbenv install 2.4.0 
rbenv global 2.4.0
ruby -v


echo "gem: --no-document" > ~/.gemrc

echo "Installing rails.."
sudo apt-get install ruby-dev
sudo gem install bundler

gem install rails -v 5.0.6 
rbenv rehash
echo "Finished installing rails"
rails -v
rbenv rehash
