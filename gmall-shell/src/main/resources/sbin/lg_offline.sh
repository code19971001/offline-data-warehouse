#!/bin/bash

for i in "hadoop02" "hadoop03"; do
  #因为执行的时候在控制打印，但是控制台打印是我们不需要的，因此可以输出到linux黑洞中去
  #标准输入0：从键盘获取输入 /proc/self/fd/0
  #标准输出1：输出到屏幕 /proc/self/fd/1
  #错误输出2：输出到屏幕 /proc/self/fd/2
  ssh $i "cd /opt/module/mock_jars/offline/log;java -jar /opt/module/mock_jars/offline/log/gmall2020-mock-log-2020-05-10.jar >/dev/null 2>&1 &"
done
