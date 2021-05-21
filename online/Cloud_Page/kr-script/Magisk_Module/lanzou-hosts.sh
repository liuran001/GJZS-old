#本脚本由　by Han | 情非得已c，编写
#应用于搞机助手上


add_hosts() {
fgrep -xq "# Start $id lanzou.com-$IP" $hosts

if [[ $? -ne 0 ]]; then
ui_print "- 正在添加hosts文件……"
sed -i '/# Start lanzou-hosts lanzou.com/,/# END lanzou-hosts lanzou.com/d' $hosts
cat <<EOF >>$hosts

# Start lanzou-hosts lanzou.com-$IP
$IP www.lanzou.com
$IP www.lanzous.com
$IP lanzou.com
$IP lanzous.com
$IP *.lanzou.com
$IP *.lanzous.com
# END lanzou-hosts lanzou.com
EOF
else
ui_print "- 已添加不再重复添加……"
fi

}

check() {
    echo "- 查找是否已安装冲突模块"
    find $Modules_Dir -name $1 | while read i; do
        modid=`echo "$i" | cut -f5 -d '/'`
        Module="$Modules_Dir/$modid"
        Module_Disable="$Module/disable"
        Module_Remove="$Module/remove"
        Module_XinXi=$Module/module.prop
        modname=`grep_prop name "$Module_XinXi"`
            if [[ ! -f "$Module_Disable" || ! -f "$Module_Remove" ]]; then
                ui_print "- 已检测到「$modname」模块修改了hosts，已在该模块上修改，如果该模块卸载或禁用会使，$name模块失效"
                hosts=$Module/system/etc/hosts
                add_hosts
                echo 1 >$Status
                [[ $modid = $id ]] && module_prop
            fi
    done
}


echo "- 正在查询lanzou.com的DNS IP"
IP=`curl -skL "https://lanzou.com.ipaddress.com/" | egrep -o '<li>[0-9.]{11,}</li>' | egrep -o -m 1 '[0-9.]{11,}'`
[[ -n "$IP" ]] && echo "- 已查询到的IP：$IP" || abort "！未连接到互联网？"

echo 0 >$Status
check hosts
[[ `cat $Status` = 1 ]] && exit 0

Clean_install

hosts=$Module/system/etc/hosts
mkdir -p $Module/system/etc
ui_print "- 正在从系统复制hosts文件……"
cp -ap /system/etc/hosts $hosts
add_hosts

description="将蓝奏云DNS IP改成$IP解决蓝奏云网址被运营商墙了导致打不开，如果失效请再次安装本模块即可"
module_prop


ui_print "- 正在设置权限……"
set_perm_recursive "$Module" 0 0 0755 0644

[[ -f $Module_XinXi ]] && ui_print "- $name模块安装完成" || abort "！$name模块安装失败"
exit 0


