#!/bin/bash

echo "****************************************************"
echo "* Waiting for the lock retrieval before apt update *"
echo "****************************************************"
# WORKAROUND for "Could not get lock /var/lib/apt/lists/lock" issue 
# https://saveriomiroddi.github.io/Handling-the-apt-lock-on-ubuntu-server-installations/
# Can take several minutes to acquire lock and execute the nginx installation.
sudo flock "$(apt-config shell StateDir Dir::State/d | perl -ne "print /'(.*)\/'/")"/daily_lock apt update

echo "************************************************************"
echo "* Waiting for the lock retrieval before nginx installation *"
echo "************************************************************"
# WORKAROUND for "Could not get lock /var/lib/apt/lists/lock" issue 
sudo flock "$(apt-config shell StateDir Dir::State/d | perl -ne "print /'(.*)\/'/")"/daily_lock apt-get -y install nginx

sudo systemctl start nginx