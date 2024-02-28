#!/bin/bash
es_home=/opt/module/elasticsearch
kibana_home=/opt/module/kibana-6.6.0
case $1 in
"start") {
  for i in hadoop02 hadoop03 hadoop04; do
    echo "==============$i 上 ES 启动=============="
    ssh $i "source /etc/profile;${es_home}/bin/elasticsearch >/dev/null 2>&1 &"
  done
  nohup ${kibana_home}/bin/kibana >${kibana_home}/logs/kibana.log 2>&1 &
} ;;
"stop") {
  ps -ef | grep ${kibana_home} | grep -v grep | awk '{print $2}' | xargs kill
  for i in hadoop02 hadoop03 hadoop04; do
    echo "==============$i 上 ES 停止=============="
    ssh $i "ps -ef|grep $es_home |grep -v grep|awk '{print \$2}'|xargs kill" >/dev/null 2>&1
  done
} ;;
esac
