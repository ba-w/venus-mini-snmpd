# venus-mini-snmpd
mini-snmpd for Victron Venus OS

(tested on Cerbo GX and Raspberry Pi 2B)

## automated install
```
wget -qO - https://github.com/ba-w/venus-mini-snmpd/archive/refs/heads/main.zip | unzip - -d /tmp
mv /tmp/venus-mini-snmpd-main /data/mini-snmpd
chmod +x /data/mini-snmpd/init.sh
/data/mini-snmpd/init.sh
```
finally run `install.sh` to activate

## manual install
```
# get
cd /tmp
wget https://github.com/troglobit/mini-snmpd/releases/download/v1.6/mini-snmpd-1.6.tar.gz
tar -xzf mini-snmpd-1.6.tar.gz

# build
cd /tmp/mini-snmpd-1.6
./configure --prefix=/data/mini-snmpd
make -j2
make install-strip

# cleanup
cd ~
rm -r /tmp/mini-snmpd-1.6
rm mini-snmpd-1.6.tar.gz
```

### then either
- add **install.sh** and **service/run** from here to the directory **/data/mini-snmpd** and make them executable
- run `install.sh` (or place it in /data/rc.local and reboot)

### or
if you like, instead of using the scripts from here you can also directly add a line for _mini-snmpd_ in /data/rc.local like this:
```
/data/mini-snmpd/sbin/mini-snmpd -D "Venus OS" -L "Cerbo GX" -C "root <root@localhost.localdomain>" -d '/data,/run/media/mmcblk0p1' -i eth0,wifi0
```

## configuration
currently hardcoded in **service/run**, I plan to add a config.ini soon

## to do
- Testing
- Config file for SNMP attributes (currently hardcoded)

## finally
using mini-snmpd from:  
https://github.com/troglobit/mini-snmpd/

and of course thanks to VictronEnergy for committing to open source  
https://www.victronenergy.com/live/open_source:start  
https://github.com/victronenergy/venus
