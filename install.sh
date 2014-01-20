#!/bin/bash

cd

# Install chef-solo
curl -L https://www.opscode.com/chef/install.sh | sudo bash

# Create chef repository structure
wget http://github.com/opscode/chef-repo/tarball/master
tar -zxf master
mv opscode-chef-repo* chef-repo
rm master

# Knife configuration
cd chef-repo
mkdir .chef
echo "cookbook_path [ '/home/ec2-user/chef-repo/cookbooks' ]" > .chef/knife.rb
mkdir cache

# Download cookbooks
cd cookbooks

knife cookbook site download yum
tar zxf yum*
rm yum*.tar.gz

knife cookbook site download build-essential
tar zxf build-essential*
rm build-essential*.tar.gz

knife cookbook site download openssl
tar zxf openssl*
rm openssl*.tar.gz

knife cookbook site download apache2
tar zxf apache2*
rm apache2*.tar.gz

knife cookbook site download mysql
tar zxf mysql*
rm mysql*.tar.gz

knife cookbook site download java
tar zxf java*
rm java*.tar.gz

knife cookbook site download tomcat
tar zxf tomcat*
rm tomcat*.tar.gz


# Install AWS tools
sudo yum --quiet install python-pip
sudo pip install --upgrade awscli

# Run chef solo
cd /home/ec2-user/ec2-chef-setup
sudo chef-solo -c solo.rb -j run.json
