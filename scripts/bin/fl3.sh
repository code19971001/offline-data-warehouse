#!/bin/bash

################################################
##author: code1997
##desc: used to start or stop flume
##example: ./fl.sh start
################################################

case $1 in
"start") {
  for i in bigdata03; do
    echo " --------启动 $i 采集flume-------"
    ssh $i "nohup /opt/software/flume-1.10.1/bin/flume-ng agent --conf-file /opt/software/flume-1.10.1/job/kafka-flume-hdfs-db.conf --name a1 -Dflume.root.logger=INFO,LOGFILE >/opt/software/flume-1.10.1/logs/log2.txt 2>&1  &"
  done
} ;;
"stop") {
  for i in bigdata03; do
    echo " --------停止 $i 采集flume-------"
    ssh $i "ps -ef | grep kafka-flume-hdfs-db | grep -v grep |awk  '{print \$2}' | xargs -n1 kill -9 "
  done
} ;;
esac
