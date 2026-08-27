#!/bin/bash


# ==================================================
# 常用工具安装
#
# 安装:
# curl
# wget
# nano
# vim
# git
# unzip
# htop
# net-tools
# lsof
# jq
# chrony
# ==================================================



TOOLS="
curl
wget
nano
vim
git
unzip
htop
net-tools
lsof
jq
chrony
"



# 状态检测

if [ "$1" = "check" ]

then


for tool in $TOOLS

do

command -v $tool >/dev/null 2>&1 || exit 1

done


exit 0


fi



echo "安装常用工具..."



apt update



apt install -y $TOOLS



echo ""

echo "工具安装完成"
