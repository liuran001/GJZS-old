#本脚本由　by Han | 情非得已c，编写
#应用于搞机助手上


V() {
    Configuration=`grep_prop Configuration $Load`
    echo "功能版本：$Util_Functions_Code"
    echo "配置版本：$Configuration"
    echo "$1版本：$Version_Name（$Version_code）"
    echo "本重制版包括Q群/TG群组免费提供，自愿打赏
唯一官方承认发布渠道为酷安@快播内部工作人员 以及官网gjzs.qqcn.xyz（或gjzs.qqcn.site）（包括其附属蓝奏云链接和coding/github仓库）
如果有人倒卖，请不遗余力在全平台举报并且曝光他！"
}

if [[ -f $Core ]]; then
	V 软件
fi
elif [[ ! -s $Core ]]; then
        echo -e "\n！连接服务器失败❌（error：404）"
fi
