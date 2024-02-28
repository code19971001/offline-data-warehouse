#!/bin/bash

################################################
##author: code1997
##desc: used to start or stop flume gather workflow. file->kafka->hdfs
##example: ./cluster.sh start
################################################

case $1 in
"start") {
  echo "================== 启动 集群 =================="
  #启动 Zookeeper集群
  zk.sh start
  #启动 Hadoop集群
  hdp.sh start

  #启动 Kafka采集集群
  kk.sh start

  #启动 Flume采集集群
  fl1.sh start

  #启动 Flume消费集群
  fl2.sh start

  fl3.sh start

  maxwell.sh start

  dolp.sh start

} ;;
"stop") {
  echo "================== 启动 集群 =================="

  dolp.sh stop

  maxwell.sh stop

  fl3.sh stop
  #停止 Flume消费集群
  fl2.sh stop

  #停止 Flume采集集群
  fl1.sh stop

  #停止 Kafka采集集群
  kk.sh stop

  #停止 Hadoop集群
  hdp.sh stop

  #循环直至 Kafka 集群进程全部停止
  kafka_count=$(xcall.sh jps | grep Kafka | wc -l)
  while [ $kafka_count -gt 0 ]; do
    sleep 1
    kafka_count=$(xcall.sh jps | grep Kafka | wc -l)
    echo "当前未停止的 Kafka 进程数为 $kafka_count"
  done

  #停止 Zookeeper集群
  zk.sh stop
} ;;
esac
