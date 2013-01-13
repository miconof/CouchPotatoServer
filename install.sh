#!/bin/bash

cd "$(dirname $0)" # quotes, to handle spaces in the path
if [ $(id -u) -eq 0 ];
then
   echo "You should run this script as a regular user"
   exit -1
fi

echo "Copying config files..."
sudo cp init/raspi /etc/init.d/couchpotato
sudo chmod 777 /etc/init.d/couchpotato
mkdir -p tor

echo "Start couchpotato service and add it to the default runlevel..."
sudo /etc/init.d/couchpotato start
sudo update-rc.d couchpotato defaults
