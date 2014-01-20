#!/bin/bash

sudo yum update
sudo yum install git
git clone git://github.com/BrunoChauvet/myrepo.git
sh myrepo/install.sh
