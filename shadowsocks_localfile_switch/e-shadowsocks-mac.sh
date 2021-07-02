#!/bin/zsh
STR=$1
if [ -z $1 ] 
then
	echo -e "\033[31m[error]args: [jp01|jp06|us02|us03|sg02|rapid], or [stop]\033[0m"
else
	## 获取1080监听的端口的pid
	PID=`lsof -i4 -P | grep -i listen | grep 1080 | awk '{print $2}'`
	## 停止脚本
	if [ "stop" = $1 ]
	then
		## 若PID不存在，则提示停止错误
		if [ -z $PID ]
		then
			echo -e "\033[31mshadowsocks is not running\033[0m"
		else
			kill $PID
			echo "shadowsocks killed success"
		fi
	elif [ "status" = $1 ]
	then
		if [ -z $PID ]
		then
			echo "shadowsocks is not running"
		else
			echo "shadowsocks[$PID] is running"
		fi
	else
		## 若PID不存在，则继续。否则提示无法启动新的实例，并打印出PID
		if [ -z $PID ]
		then
			## 运行脚本
			if [ -f ~/opt/shadowsocks/config.json.$1 ]
			then
				nohup sslocal -c ~/opt/shadowsocks/config.json.$1 &
			else
				echo -e "\033[31m[error]file is not exists\033[0m"
			fi
		else
			echo -e "\033[31m[error]shaodowsocks pid[$PID] is exists,cannot create a new instance\033[0m"
		fi
	fi
fi
