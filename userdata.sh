#!/bin/bash

sudo yum --quiet update
sudo yum --quiet install git
git clone git://github.com/BrunoChauvet/ec2-chef-setup.git
sh ec2-chef-setup/install.sh
