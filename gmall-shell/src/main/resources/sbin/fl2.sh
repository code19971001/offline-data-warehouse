#!/bin/bash

################################################
##author: code1997
##desc: used to start or stop flume
##example: ./fl.sh start
################################################

case $1 in
"start") {
  for i in hadoop04; do
    echo " --------启动 $i 采集flume-------"
    ssh $i "nohup /opt/module/flume-1.9.0/bin/flume-ng agent --conf-file /opt/module/flume-1.9.0/conf/kafka-flume-hdfs.conf --name a1 -Dflume.root.logger=INFO,LOGFILE >/opt/module/flume-1.9.0/logs/log2.txt 2>&1  &"
  done
} ;;
"stop") {
  for i in hadoop04; do
    echo " --------停止 $i 采集flume-------"
    ssh $i "ps -ef | grep kafka-flume-hdfs | grep -v grep |awk  '{print \$2}' | xargs -n1 kill -9 "
  done
} ;;
esac
