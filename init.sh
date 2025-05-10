#!/bin/bash

if ! [ -x "$(command -v make)" ]; then
        echo -e "\nFor the build procces on installation you need the \"Venus OS Large image\"."
        echo -e "After Installation you can return to the standard image."
        echo -e "\n https://www.victronenergy.com/live/venus-os:large\n"
        exit 1
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
wget -qO - https://github.com/troglobit/mini-snmpd/releases/download/v1.6/mini-snmpd-1.6.tar.gz | tar -xzf - -C /tmp
cd /tmp/mini-snmpd-1.6
./configure --prefix=/data/mini-snmpd
make -j2
make install-strip
cd $SCRIPT_DIR
rm -r /tmp/mini-snmpd-1.6
chmod +x /data/mini-snmpd/install.sh
