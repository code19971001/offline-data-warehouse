#!/bin/bash
case $1 in
"start") {
  echo "************开启zookeeper**************"
  for i in hadoop02 hadoop03 hadoop04; do
    echo "************$i**************"
    ssh $i '/opt/module/zookeeper-3.4.10/bin/zkServer.sh start'
  done

} ;;

"stop") {
  echo "************关闭zookeeper**************"
  for i in hadoop02 hadoop03 hadoop04; do
    echo "************$i**************"
    ssh $i '/opt/module/zookeeper-3.4.10/bin/zkServer.sh stop'
  done

} ;;

"status") {
  echo "************zookeeper状态**************"
  for i in hadoop02 hadoop03 hadoop04; do
    echo "************$i**************"
    ssh $i '/opt/module/zookeeper-3.4.10/bin/zkServer.sh status'
  done

} ;;

esac
