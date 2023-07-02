#!/bin/bash

# Update and upgrade system
sudo apt update
sudo apt upgrade -y

# Install NGINX
sudo apt install nginx -y

# Install dependencies for Ruby
sudo apt install git curl libssl-dev libreadline-dev zlib1g-dev libsqlite3-dev -y

# Install rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc

# Install ruby-build plugin
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

# Install Ruby 3.2.2
rbenv install 3.2.2
rbenv global 3.2.2

# Install bundler and project dependencies
gem install bundler
rbenv rehash

# Open port 8080
sudo ufw allow 8080

# Clone the repository
git clone https://github.com/ProudCircle/WebServer.git
cd WebServer/src

# Install gems
bundle install

# Run the web server on port 8080
rails server -p 8080
