#!/bin/bash

# ==================================================
# CCPT VPS Tools 公共函数
#
# 所有模块共享
# ==================================================



# 输出标题

show_title(){

echo ""
echo "================================="
echo "$1"
echo "================================="
echo ""

}



# 判断命令是否存在

command_exists(){

command -v "$1" >/dev/null 2>&1

}



# 备份文件

backup_file(){

FILE=$1


if [ -f "$FILE" ]
then

cp "$FILE" \
"$FILE.backup.$(date +%Y%m%d%H%M%S)"

fi

}



# 判断是否root

check_root(){


if [ "$EUID" -ne 0 ]

then

echo "请使用root运行"

exit 1

fi


}
