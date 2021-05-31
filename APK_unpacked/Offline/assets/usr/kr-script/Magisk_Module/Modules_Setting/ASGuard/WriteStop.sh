conf='/data/media/0/Android/ASGuard.conf'
load() {
text="#面板日期：2021.05.16#作者：酷安@沍澤#QQ用户群：837934310#
#======================提示========================
#需要保护的APP包名请填在下面AS的\" \"内，一行一个！不要填在\" \"外面！否则无法正常运行！
#填在AS配置里的包名不需要填到package_Whitelist里面

AS=\"${AS}\"

#这个是电池优化白名单列表，开机将自动加入电池优化白名单，修改此项重启生效
#一行一个包名，填在\" \"内！
package_whitelist=\"${package_whitelist}\"

#是否开启Magisk模块列表运行时间显示
#开启：1 关闭：0
timemarker=${timemarker}

#是否开启开机清空电池优化白名单选项
#开启：1 关闭：0
whitelistclear=${whitelistclear}

#重复写入开关，如果无障碍服务无法运行的情况出现过于频繁可尝试开启此选项
#开启：1 关闭：0
rewrite=${rewrite}

#是否开启log
#开启：1 关闭：0
log=${log}

#开机是否覆盖原有已开启的无障碍功能开关（重启生效）
#开启：1 关闭：0
cover=${cover}

#是否只进行开机开启无障碍功能（重启生效）
#如果是则在开启保存的无障碍后自动结束本模块服务进程
#此开关不影响开机清空电池优化白名单开关#开启：1 关闭：0
stop=${stop}

#模块目录，请不要随便修改
MODPATH=${MODPATH}
"
}

source ${conf}
stop=${state}
load
echo "${text}" > ${conf}
