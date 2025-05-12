#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
SERVICE_NAME=$(basename $SCRIPT_DIR)
RC_LOCAL_FILE=/data/rc.local

chmod a+x $SCRIPT_DIR/install.sh
chmod 744 $SCRIPT_DIR/install.sh

chmod a+x $SCRIPT_DIR/uninstall.sh
chmod 744 $SCRIPT_DIR/uninstall.sh

chmod a+x $SCRIPT_DIR/service/run
chmod 755 $SCRIPT_DIR/service/run

ln -s $SCRIPT_DIR/service /service/$SERVICE_NAME

if [ ! -f $RC_LOCAL_FILE ]
then
    touch $RC_LOCAL_FILE
    chmod 755 $RC_LOCAL_FILE
    echo "#!/bin/bash" >> $RC_LOCAL_FILE
    echo >> $RC_LOCAL_FILE
fi

grep -qxF "$SCRIPT_DIR/install.sh" $RC_LOCAL_FILE || echo "$SCRIPT_DIR/install.sh" >> $RC_LOCAL_FILE
