#!/bin/bash

sudo yum update
sudo yum install git
git clone git://github.com/BrunoChauvet/ec2-chef-setup.git
sh ec2-chef-setup/install.sh
