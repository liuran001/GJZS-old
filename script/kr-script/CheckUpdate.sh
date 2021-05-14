#本脚本由　by Han | 情非得已c，编写
#应用于搞机助手上


V() {
    Configuration=`grep_prop Configuration $Load`
    echo "云端页面：`cat $Data_Dir/Cloud_Version.log`"
    echo "功能版本：$Util_Functions_Code"
    echo "配置版本：$Configuration"
    echo "$1版本：$Version_Name（$Version_code）"
}

if [[ -f $Core ]]; then
    if [[ $Version_code -lt $New_Code ]]; then
        echo "- 当前版本：$Version_Name（$Version_code）"
        echo "- 已发布了最新版本：$New_Version（$New_Code）"
        echo
        echo "- 如果你是从别的渠道下载的请确保签名MD5一致，如果有发现未签名，或签名信息不对的请谨慎安装，因为已经有盗版软件伪装成「搞机助手」。导致有人安装后被格机/锁机或更为严重的后果"
        echo "- 签名MD5：5FE53E98E794A73796879337A0A30466"
        echo "- 推荐使用MT管理器进行签名MD5对比，点击apk文件 -->点击签名状态右边的信息 -->对比"
        echo "- 如果你在软件上遇到bug，可在微信公众号：HanGJZS里的微信号联系上我，或者发送邮件到243454893@qq.com"
    elif [[ $Version_code -eq $New_Code ]]; then
        V 软件
    else
        echo "！未知版本：$Version_Name（$Version_code）"
    fi
elif [[ ! -s $Core ]]; then
        echo -e "\n！连接服务器失败❌（error：404）"
fi
