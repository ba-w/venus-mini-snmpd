#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
SERVICE_NAME=$(basename $SCRIPT_DIR)

chmod a+x $SCRIPT_DIR/install.sh
chmod 744 $SCRIPT_DIR/install.sh

chmod a+x $SCRIPT_DIR/service/run
chmod 755 $SCRIPT_DIR/service/run

ln -s $SCRIPT_DIR/service /service/$SERVICE_NAME

filename=/data/rc.local
if [ ! -f $filename ]
then
    touch $filename
    chmod 755 $filename
    echo "#!/bin/bash" >> $filename
    echo >> $filename
fi

grep -qxF "$SCRIPT_DIR/install.sh" $filename || echo "/bin/bash $SCRIPT_DIR/install.sh" >> $filename
