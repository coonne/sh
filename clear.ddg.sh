#!/bin/bash
# clear
date +"%Y-%m-%d %H:%M:%S"
pid=`ps -ef|grep ddg|grep -v grep |awk '{print $2}'`
if [ ! -z $pid ];then
  echo "exist ddg"
  echo "start kill dgg...."
  kill -9 $pid
else 
  echo "no ddg"
fi


i_pid=`ps -ef|grep imW|grep -v grep |awk '{print $2}'`
if [ ! -z $i_pid ];then
  echo "exist imW"
  echo "start kill  imw...."
  kill -9 $i_pid
else
  echo "no imW"
fi

echo "*******************************   检查 Cron 任务 *****************************************"
crontab -l
echo ""
echo ""

crontab -r 
#删除crontab

rm -rf /tmp/ddg* #删除本体
rm -rf /tmp/imW* #删除本体

echo "PermitRootLogin no" >> /etc/ssh/sshd_config
systemctl restart sshd.service
