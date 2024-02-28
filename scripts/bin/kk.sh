#!/bin/bash
case $1 in
"start") {
  echo "************开启kafka**************"
  for i in bigdata01 bigdata02 bigdata03; do
    echo "************$i**************"
    ssh $i '/opt/software/kafka_2.12-3.3.1/bin/kafka-server-start.sh -daemon /opt/software/kafka_2.12-3.3.1/config/server.properties'
  done
  echo "***************starting EFAK***************"
  /opt/software/efak-web-3.0.2/bin/ke.sh start
} ;;

"stop") {
  echo "************关闭kafka**************"
  for i in bigdata01 bigdata02 bigdata03; do
    echo "************$i**************"
    ssh $i '/opt/software/kafka_2.12-3.3.1/bin/kafka-server-stop.sh'
  done
  echo "***************stoping EFAK***************"
  /opt/software/efak-web-3.0.2/bin/ke.sh stop

} ;;

esac
