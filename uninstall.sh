#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
SERVICE_NAME=$(basename $SCRIPT_DIR)
RC_LOCAL_FILE=/data/rc.local

if [ -d /service/$SERVICE_NAME ]; then
  rm /service/$SERVICE_NAME
fi

#kill $(pgrep -f "$SCRIPT_DIR/service/../sbin/$SERVICE_NAME")
pids=$(pgrep -f $SERVICE_NAME)
if [ ! -z "$pids" ]
then
  for pid in $pids
  do
    kill $pid
  done
fi

STARTUP=$SCRIPT_DIR/install.sh
sed -i "\~$STARTUP~d" $RC_LOCAL_FILE
