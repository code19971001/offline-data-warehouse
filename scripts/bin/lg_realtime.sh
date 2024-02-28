########################################################
########################################################
## author: code1997
## example: this script used to start/stop logger jar and nginx
###  1)logger.sh start
###  1)logger.sh stop
########################################################

#set java path
JAVA_BIN=${JAVA_HOME}/bin/java
BASE_PATH=/opt/module/mock_jars/realtime/logger
APP_NAME=gmall-logger.jar
case $1 in
"start") {
  for i in "hadoop02" "hadoop03" "hadoop04"; do
    echo "========Starting logger app on server : $i==============="
    echo "$JAVA_BIN -Xms32m -Xmx64m -jar ${BASE_PATH}/$APP_NAME >/dev/null 2>&1  &"
    ssh $i "$JAVA_BIN -Xms32m -Xmx64m -jar ${BASE_PATH}/$APP_NAME >/dev/null 2>&1  &"
  done
  echo "========Starting NGINX on server hadoop02==============="
  /opt/module/nginx/sbin/nginx
} ;;
"stop") {
  for i in "hadoop02" "hadoop03" "hadoop04"; do
    echo "======== Stopping logger app on server : $i==============="
    ssh $i "ps -ef|grep $APP_NAME | grep -v grep|awk '{print \$2}'| xargs kill" >/dev/null 2>&1
  done
  echo "========Stopping NGINX on server hadoop02==============="
  /opt/module/nginx/sbin/nginx -s stop
} ;;
esac
