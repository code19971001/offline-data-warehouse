#!/bin/bash
########################################################
########################################################
## author: code1997
## example: this script used to start maxwell
###  1)maxwell.sh
########################################################
MAXWELL_HOME=/opt/software/maxwell-1.29.2

status_maxwell() {
  result=$(ps -ef | grep com.zendesk.maxwell.Maxwell | grep -v grep | wc -l)
  return $result
}

start_maxwell() {
  status_maxwell
  if [[ $? -lt 1 ]]; then
    echo "Starting Maxwell"
    $MAXWELL_HOME/bin/maxwell --config $MAXWELL_HOME/config.properties --daemon
  else
    echo "Maxwell is Running"
  fi
}

stop_maxwell() {
  status_maxwell
  if [[ $? -gt 0 ]]; then
    echo "Stopping Maxwell"
    ps -ef | grep com.zendesk.maxwell.Maxwell | grep -v grep | awk '{print $2}' | xargs kill -9
  else
    echo "Maxwell is not running status"
  fi
}
# full load table
# maxwell-bootstrap --database gmall --table user_info --config /opt/software/maxwell-1.29.2/config.properties
case $1 in
"start")
  start_maxwell
  ;;
"stop")
  stop_maxwell
  ;;
"status")
  status_maxwell
  if [[ $? -gt 0 ]]; then
    echo "Maxwell is running"
  else
    echo "Maxwell is not running status"
  fi
  ;;
"restart")
  stop_maxwell
  start_maxwell
  ;;
esac
