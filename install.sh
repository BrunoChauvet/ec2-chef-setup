#!/bin/bash

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

# Download cookbooks
cd cookbooks

knife cookbook site download apache2
tar zxf apache2*
rm apache2*.tar.gz

knife cookbook site download mysql
tar zxf mysql*
rm mysql*.tar.gz

knife cookbook site download java
tar zxf java*
rm java*.tar.gz


# Install AWS tools
sudo yum --quiet install python-pip
sudo pip install --upgrade awscli
# ... run chef
# - mysql5
# - java
# - tomcat
# - ...