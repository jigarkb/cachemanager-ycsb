#!/bin/bash
#
# This shell script uses YCSB benchmark A to load the database for YCSB.

if [ $# -ne 4 ]; then
  echo "Usage: fill.sh wd coordLocator logDir clientIds"
  exit 1
fi

WD=$1
COORD=$2
LOG_DIR=$3
CLIENTS=$4
SSH_CRED="/home/admin/.ssh/jigar_cloud_admin"

LOGS=""
START="0"
for CLIENT in $CLIENTS; do LAST_CLIENT=$CLIENT; done
for CLIENT in $CLIENTS; do
  LOG=$LOG_DIR/fill-ramcloud$CLIENT.log
  LOGS="$LOGS $LOG"
  if (($CLIENT == $LAST_CLIENT)); then
    ssh -i $SSH_CRED admin@ramcloud$CLIENT \
        $WD/rc-ycsb.sh workloada \
        10000000 \
        $COORD \
        $START \
        1000000 > $LOG 2>&1
  else
    ssh -i $SSH_CRED admin@ramcloud$CLIENT \
        $WD/rc-ycsb.sh workloada \
        10000000 \
        $COORD \
        $START \
        1000000 > $LOG 2>&1 &
  fi
  ((START=START+1000000))
  sleep .01
  done

./waitClients.sh $LOGS