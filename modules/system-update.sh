#!/bin/bash


# ==================================================
# 系统更新模块
#
# 功能:
# 更新APT软件源
# 升级系统软件包
# ==================================================


# 状态检测模式

if [ "$1" = "check" ]

then


if [ -f "/var/lib/apt/periodic/update-success-stamp" ]

then

exit 0

else

exit 1

fi


fi



echo "开始更新系统..."



apt update


apt upgrade -y



# 创建更新时间标记

mkdir -p /var/lib/apt/periodic


touch /var/lib/apt/periodic/update-success-stamp



echo ""

echo "系统更新完成"
