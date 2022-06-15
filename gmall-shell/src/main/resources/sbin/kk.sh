#!/bin/bash
case $1 in
"start") {
  echo "************开启kafka**************"
  for i in hadoop02 hadoop03 hadoop04; do
    echo "************$i**************"
    ssh $i '/opt/module/kafka/bin/kafka-server-start.sh -daemon /opt/module/kafka/config/server.properties'
  done

} ;;

"stop") {
  echo "************关闭kafka**************"
  for i in hadoop02 hadoop03 hadoop04; do
    echo "************$i**************"
    ssh $i '/opt/module/kafka/bin/kafka-server-stop.sh'
  done

} ;;

esac
