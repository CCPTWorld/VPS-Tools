#!/bin/bash

# ==================================================
# CCPT VPS Tools
#
# VPS 一键初始化管理工具
#
# 功能：
#  - 系统初始化
#  - 网络优化
#  - 安全加固
#  - Docker管理
#  - 日志管理
#
# GitHub:
# https://github.com/CCPTWorld/VPS-Tools
#
# ==================================================


# 遇到错误不立即退出
# 防止模块检测失败导致菜单退出
set +e


# GitHub仓库地址
BASE_URL="https://raw.githubusercontent.com/CCPTWorld/VPS-Tools/main"


# 临时目录
WORK_DIR="/tmp/ccpt-vps-tools"


# 模块目录
MODULE_DIR="$WORK_DIR/modules"



# 创建目录

mkdir -p "$MODULE_DIR"



# 下载模块

download_module(){

    MODULE_NAME=$1


    curl -fsSL \
    "$BASE_URL/modules/$MODULE_NAME" \
    -o "$MODULE_DIR/$MODULE_NAME" \
    >/dev/null 2>&1


    chmod +x "$MODULE_DIR/$MODULE_NAME"

}



# 执行模块

run_module(){

    MODULE_NAME=$1


    echo

    echo "正在执行: $MODULE_NAME"

    echo


    download_module "$MODULE_NAME"


    if bash "$MODULE_DIR/$MODULE_NAME"
    then
        echo
        echo "执行完成"
    else
        echo
        echo "执行失败，请检查错误"
    fi


    echo

    read -p "按回车返回菜单..."

}



# 检测模块状态

# 已完成返回 √
# 未完成返回 ×

check_module(){

    MODULE_NAME=$1


    download_module "$MODULE_NAME"



    if bash "$MODULE_DIR/$MODULE_NAME" check >/dev/null 2>&1
    then

        echo "√"

    else

        echo "×"

    fi

}




# 显示菜单

show_menu(){

clear


cat <<EOF

========================================

        CCPT VPS Tools

========================================


基础初始化


1.  系统更新              [$(check_module system-update.sh)]

2.  常用工具安装          [$(check_module install-tools.sh)]

3.  时区设置              [$(check_module timezone.sh)]


4.  主机名称设置          [×]

5.  时间同步              [×]


6.  TCP调优(BBR+FQ)       [×]

7.  Fail2ban              [×]

8.  SSH配置               [×]


9.  Swap管理              [×]

10. journald日志限制      [×]



Docker管理


11. Docker安装            [×]

12. Docker管理            [×]

13. Docker日志轮转        [×]



其他


14. Nginx日志轮转         [×]

15. 自动清理缓存          [×]

16. 基础安全参数           [×]



0. 退出


========================================


EOF

}



# ===============================
# 主程序循环
# ===============================


while true
do


    show_menu


    echo

    read -p "请输入选项: " CHOICE



    case "$CHOICE" in



    1)

        run_module system-update.sh

        ;;



    2)

        run_module install-tools.sh

        ;;



    3)

        run_module timezone.sh

        ;;



    0)

        echo

        echo "退出 CCPT VPS Tools"

        exit 0

        ;;



    *)

        echo

        echo "无效选项"

        sleep 2

        ;;


    esac


done
