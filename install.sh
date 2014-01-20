#!/bin/bash

# Install chef-solo
curl -L https://www.opscode.com/chef/install.sh | sudo bash
# Install AWS tools
sudo yum --quiet install python-pip
sudo pip install --upgrade awscli
# ... run chef
# - mysql5
# - java
# - tomcat
# - ...