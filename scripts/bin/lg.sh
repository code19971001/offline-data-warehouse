#!/bin/bash

for i in "bigdata01"; do
  #因为执行的时候在控制打印，但是控制台打印是我们不需要的，因此可以输出到linux黑洞中去
  #标准输入0：从键盘获取输入 /proc/self/fd/0
  #标准输出1：输出到屏幕 /proc/self/fd/1
  #错误输出2：输出到屏幕 /proc/self/fd/2
  ssh $i "cd /opt/app/gmall;nohup java -jar gmall-remake-mock-2023-05-15-3.jar $1 $2 $3 >/dev/null 2>&1 &"
done
