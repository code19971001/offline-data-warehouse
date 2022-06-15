#!/bin/bash

################################################
##author: code1997
##desc: use to execute command for linux machine list
##example: xcall jsp
################################################

for i in "hadoop02" "hadoop03" "hadoop04"; do
  echo "--------------$i-------------"
  ssh $i "$*"
done
