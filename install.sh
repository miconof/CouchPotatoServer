#!/bin/bash

cd `dirname $0`

echo "Copying config files..."
cp init/raspi /etc/init.d/couchpotato
chmod 777 /etc/init.d/couchpotato
su pi -c 'mkdir -p tor'

echo "Start couchpotato service and add it to the default runlevel..."
/etc/init.d/couchpotato start
update-rc.d couchpotato defaults
