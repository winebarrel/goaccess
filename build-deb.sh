#!/bin/bash
sudo apt-get install -y dpkg-dev debhelper
sudo dpkg-buildpackage -us -uc
