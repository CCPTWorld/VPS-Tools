#!/bin/bash


# ==================================================
# 时区设置模块
#
# 设置:
# Asia/Shanghai
#
# ==================================================



# 检测模式

if [ "$1" = "check" ]

then


CURRENT=$(timedatectl show \
--property=Timezone \
--value)


[ "$CURRENT" = "Asia/Shanghai" ]


exit $?


fi



echo "当前时区:"

timedatectl



echo ""

echo "设置时区 Asia/Shanghai"



timedatectl set-timezone Asia/Shanghai



echo ""

echo "设置完成"


timedatectl
