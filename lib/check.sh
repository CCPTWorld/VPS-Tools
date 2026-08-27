#!/bin/bash

# ==================================================
# CCPT VPS Tools 状态检测
# ==================================================



# 检测系统是否更新

check_system_update(){

if [ -f "/var/lib/apt/periodic/update-success-stamp" ]

then

return 0

else

return 1

fi

}



# 检测基础工具

check_tools(){


for cmd in curl wget nano vim git unzip htop

do

command -v $cmd >/dev/null 2>&1 || return 1

done


return 0

}



# 检测时区

check_timezone(){


TIMEZONE=$(timedatectl show \
--property=Timezone \
--value)


if [ "$TIMEZONE" = "Asia/Shanghai" ]

then

return 0

else

return 1

fi

}
