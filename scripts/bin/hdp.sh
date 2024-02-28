#!/bin/bash

#####################################################
##author: code1997
##desc: used to start or stop hdfs, yarn, history server services
##example: hdp.sh start
#####################################################

if [ $# -lt 1 ]; then
  echo "No Args Input..."
  exit
fi
case $1 in
"start")
  echo " =================== 启动 hadoop集群 ==================="

  echo " --------------- 启动 hdfs ---------------"
  ssh bigdata01 "/opt/software/hadoop-3.3.4/sbin/start-dfs.sh"
  echo " --------------- 启动 yarn ---------------"
  ssh bigdata02 "/opt/software/hadoop-3.3.4/sbin/start-yarn.sh"
  echo " --------------- 启动 historyserver ---------------"
  ssh bigdata01 "/opt/software/hadoop-3.3.4/bin/mapred --daemon start historyserver"
  ;;
"stop")
  echo " =================== 关闭 hadoop集群 ==================="

  echo " --------------- 关闭 historyserver ---------------"
  ssh bigdata01 "/opt/software/hadoop-3.3.4/bin/mapred --daemon stop historyserver"
  echo " --------------- 关闭 yarn ---------------"
  ssh bigdata02 "/opt/software/hadoop-3.3.4/sbin/stop-yarn.sh"
  echo " --------------- 关闭 hdfs ---------------"
  ssh bigdata01 "/opt/software/hadoop-3.3.4/sbin/stop-dfs.sh"
  ;;
*)
  echo "Input Args Error..."
  ;;
esac
