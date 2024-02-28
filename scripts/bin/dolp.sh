#!/bin/bash
case $1 in
"start") {
  echo "************开启 dolphinscheduler**************"
  for i in bigdata01; do
    echo "************$i**************"
    ssh $i '/opt/software/dolphinscheduler/bin/start-all.sh'
  done
} ;;

"stop") {
  echo "************关闭 dolphinscheduler**************"
  for i in bigdata01; do
    echo "************$i**************"
    ssh $i '/opt/software/dolphinscheduler/bin/stop-all.sh'
  done

} ;;

esac