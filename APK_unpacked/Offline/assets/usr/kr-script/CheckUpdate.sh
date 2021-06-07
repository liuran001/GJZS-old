#本脚本由　by Han | 情非得已c，编写
#应用于搞机助手上


V() {
    Configuration=`grep_prop Configuration $Load`
    echo "功能版本：$Util_Functions_Code"
    echo "配置版本：$Configuration"
    echo "$1版本：$Version_Name（$Version_code）"
    echo "永久免费，禁止倒卖"
}

if [[ -f $Core ]]; then
	V 软件
fi
elif [[ ! -s $Core ]]; then
        echo -e "\n！连接服务器失败❌（error：404）"
fi
