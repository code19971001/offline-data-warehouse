#!/bin/bash

################################################
##author: code1997
##desc: use to execute command for linux machine list
##example: xcall.sh jsp
################################################

for i in "bigdata01" "bigdata02" "bigdata03"; do
  echo "--------------$i-------------"
  ssh $i "$*"
done
