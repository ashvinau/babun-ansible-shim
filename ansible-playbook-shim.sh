#!/bin/bash

# this file should reside in /.babun/cygwin/usr/local/bin/
# permissions need to be set for execute $ chmod u+x ansible-playbook-shim.sh

set -e
echo "initial parameters: $@"

echo "disabling control master, doesn't work in windows"
ANSIBLE_SSH_ARGS=`echo $ANSIBLE_SSH_ARGS | sed -E "s|ControlMaster=([^ ]*)|ControlMaster=no|"`
ANSIBLE_SSH_ARGS=`echo $ANSIBLE_SSH_ARGS | sed -E "s|-o ControlPersist=([^ ]*)||"`	
export ANSIBLE_SSH_ARGS=$ANSIBLE_SSH_ARGS 

echo "parsing inventory path for babun and ansible"
INVENTORY=`echo $@ | sed -E 's|.*--inventory-file=([^ ]*).*|\1|'`
NEW_INVENTORY=$(cygpath -u $INVENTORY)
ARGS=`echo $@ | sed -E "s|$INVENTORY|$NEW_INVENTORY|"`
echo "final arguments: $ARGS"
ansible-playbook $ARGS
