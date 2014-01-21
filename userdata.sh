#!/bin/bash

# User data to be applied on the EC2 instance
sudo yum -y update
sudo yum -y install git
git clone git://github.com/BrunoChauvet/ec2-chef-setup.git
sh ec2-chef-setup/install.sh
