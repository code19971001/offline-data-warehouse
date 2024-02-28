#!/bin/bash
case $1 in
"start") {
  echo "************开启zookeeper**************"
  for i in bigdata01 bigdata02 bigdata03; do
    echo "************$i**************"
    ssh $i '/opt/software/zookeeper-3.7.1/bin/zkServer.sh start'
  done

} ;;

"stop") {
  echo "************关闭zookeeper**************"
  for i in bigdata01 bigdata02 bigdata03; do
    echo "************$i**************"
    ssh $i '/opt/software/zookeeper-3.7.1/bin/zkServer.sh stop'
  done

} ;;

"status") {
  echo "************zookeeper状态**************"
  for i in bigdata01 bigdata02 bigdata03; do
    echo "************$i**************"
    ssh $i '/opt/software/zookeeper-3.7.1/bin/zkServer.sh status'
  done

} ;;

esac
