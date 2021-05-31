#!/data/adb/modules/shadow_screenshots/busybox/bin/sh
echo '<?xml version="1.0" encoding="utf-8"?>'
MODPATH="/data/adb/modules/shadow_screenshots"
[[ -d ${MODPATH} ]] || MODPATH="/data/adb/lite_modules/shadow_screenshots"
MODURL="https://wwa.lanzoui.com/iyLJ9pb56bi"
MODVERSION="v3.0.1"
download(){
	echo '<group>'
	echo '<text>'
	echo '<slice u="true" align="center" break="true" link="'${MODURL}'" size="20">'$1'&#x000A;点击获取'${MODVERSION}'版本下载链接</slice>'
	echo '</text>'
	echo '</group>'
	exit
}
if [ -d "${MODPATH}" ];then
	PROP="${MODPATH}/module.prop"
	LOG="${MODPATH}/service.log"
	DISABLE="${MODPATH}/disable"
	SERVICE="${MODPATH}/service.sh"
	WM="${MODPATH}/水印.png"
	source "${PROP}"
	[[ ${version} == ${MODVERSION} ]] || download 模块不是最新版
else
	download 未安装模块
fi


cat <<-EOF
<group>
	<switch shell="hidden">
		<title>阴影截图(免重启模块开关)</title>
		<desc>
			-版本 ${version}
			-作者 ${author}
			-路径 ${MODPATH}
			-介绍 ${description}
		</desc>
		<get>
			if [ -f ${DISABLE} ]; then
				echo 0
			else
				echo 1
			fi
		</get>
		<set>
			if [ \${state} -eq 1 ]; then
				nohup ${SERVICE} >/dev/null 2>&#38;1
			else
				[ -f ${DISABLE} ] || touch ${DISABLE}
			fi
		</set>
	</switch>
</group>

<group>
	<action>
		<title>查看当前详细配置</title>
		<set>
			cat ${PROP}
		</set>
	</action>
	<action>
		<title>查看最近一百条log记录</title>
		<set>
			if [ -f ${LOG} ]; then
				tail -n 100 $LOG
			else
				echo 'log不存在，检查是否已开启'
			fi
		</set>
	</action>
</group>
<group>
	<action shell="hidden">
		<title>监听目录选择</title>
		<param
			name="SHOTSPATH"
			title="多个目录手动输入空格隔开"
			type="folder"
			editable="true"
			value="${screenshots}"/>
		<set>
			sed -i 's@^screenshots=.*@screenshots=&#34;'\${SHOTSPATH}'&#34;@g' ${PROP}
		</set>
	</action>
	<action shell="hidden">
		<title>阴影截图保存目录</title>
		<param
			name="SHOTSPATH"
			title="开启覆盖原图失效"
			type="folder"
			editable="true"
			value="${screenshots}_shadow"/>
		<set>
			sed -i 's@^screenshots_shadow=.*@screenshots_shadow=&#34;'\${SHOTSPATH}'&#34;@g' ${PROP}
		</set>
	</action>
	<action shell="hidden">
		<title>分辨率设置</title>
		<param
			name="DPI"
			title="本机分辨率识别 使用此项自由填写需留空"
			option-sh="wm size | grep -oE '[0-9]+x[0-9]+'"/>
		<param
			name="DPI2"
			title="自由填写分辨率 填写后不使用自动识别"
			type="text"
			value="${WH}"/>
		<set>
			[[ -n \${DPI2} ]] &#38;&#38; DPI=\${DPI2}
			sed -i 's/^WH=.*/WH=&#34;'\${DPI}'&#34;/g' ${PROP}
		</set>
	</action>
	<action shell="hidden">
		<title>休眠规则</title>
		<param
			name="XM1"
			title="修改现有规则 未勾选的规则确认后将会删除"
			multiple="true"
			separator=" "
			value-sh="sed -n '/^[ 	]*t[0-9]*=/p' ${PROP} | grep -oE '[0-9:]*-[0-9:]*' | tr '\n' ' '"
			options-sh="sed -n '/^[ 	]*t[0-9]*=/p' ${PROP} | grep -oE '[0-9:]*-[0-9:]*'"/>
		<param
			name="XM2"
			title="添加新的规则 多个规则另起一行或空格隔开"
			type="text"
			placeholder="格式00:00-00:00 例9:30-13:30"/>
		<set>
			i=1
			sed -i '/^[ 	]*t[0-9]*=/d' ${PROP}
			for j in \${XM1} \${XM2}
			do
				sed -i '/#休眠标识行/a\ t'\${i}'=&#34;'\${j}'&#34;' ${PROP}
				i=\$(( \${i} + 1 ))
			done
		</set>
	</action>
	<action shell="hidden">
		<title>运行时间间隔</title>
		<param
			name="TIME1"
			title="亮屏间隔 时间越短处理越及时"
			type="seekbar"
			min="1"
			max="60"
			value="${time1}"/>
		<param
			name="TIME2"
			title="息屏间隔 点亮屏幕后也要等到上一个间隔结束"
			type="seekbar"
			min="1"
			max="300"
			value="${time2}"/>
		<set>
			sed -i 's/^time1=.*/time1=&#34;'\${TIME1}'&#34;/g' ${PROP}
			sed -i 's/^time2=.*/time2=&#34;'\${TIME2}'&#34;/g' ${PROP}
		</set>
	</action>
	<switch shell="hidden" reload="true">
		<title>是否覆盖原图</title>
		<get>
			if [[ ${switch1} == yes ]]; then
				echo 1
			else
				echo 0
			fi
		</get>
		<set>
			if [ \${state} -eq 1 ]; then
				sed -i 's/^switch1=.*/switch1=&#34;yes&#34;/g' ${PROP}
			else
				sed -i 's/^switch1=.*/switch1=&#34;no&#34;/g' ${PROP}
			fi
		</set>
	</switch>
	<switch shell="hidden" reload="true">
		<title>深色模式反转边缘阴影</title>
		<get>
			if [[ ${switch2} == yes ]]; then
				echo 1
			else
				echo 0
			fi
		</get>
		<set>
			if [ \${state} -eq 1 ]; then
				sed -i 's/^switch2=.*/switch2=&#34;yes&#34;/g' ${PROP}
			else
				sed -i 's/^switch2=.*/switch2=&#34;no&#34;/g' ${PROP}
			fi
		</set>
	</switch>
	<switch shell="hidden" reload="true">
		<title>开机后杀死媒体存储设备</title>
		<get>
			if [[ ${switch3} == yes ]]; then
				echo 1
			else
				echo 0
			fi
		</get>
		<set>
			if [ \${state} -eq 1 ]; then
				sed -i 's/^switch3=.*/switch3=&#34;yes&#34;/g' ${PROP}
			else
				sed -i 's/^switch3=.*/switch3=&#34;no&#34;/g' ${PROP}
			fi
		</set>
	</switch>
	<switch shell="hidden" reload="true">
		<title>套完阴影后刷新相册</title>
		<get>
			if [[ ${switch4} == yes ]]; then
				echo 1
			else
				echo 0
			fi
		</get>
		<set>
			if [ \${state} -eq 1 ]; then
				sed -i 's/^switch4=.*/switch4=&#34;yes&#34;/g' ${PROP}
			else
				sed -i 's/^switch4=.*/switch4=&#34;no&#34;/g' ${PROP}
			fi
		</set>
	</switch>
	<switch shell="hidden" reload="true">
		<title>开启log记录</title>
		<get>
			if [[ ${switch5} == yes ]]; then
				echo 1
			else
				echo 0
			fi
		</get>
		<set>
			if [ \${state} -eq 1 ]; then
				sed -i 's/^switch5=.*/switch5=&#34;yes&#34;/g' ${PROP}
			else
				sed -i 's/^switch5=.*/switch5=&#34;no&#34;/g' ${PROP}
			fi
		</set>
	</switch>
	<action shell="hidden">
		<title>监控图片关键字</title>
		<param
			name="FORMAT1"
			title="监控关键字 用 | 隔开"
			type="text"
			value="${format1}"/>
		<param
			name="FORMAT2"
			title="排除关键字 用 | 隔开"
			type="text"
			value="${format2}"/>
		<set>
			sed -i 's/^format1=.*/format1=&#34;'\${FORMAT1}'&#34;/g' ${PROP}
			sed -i 's/^format2=.*/format2=&#34;'\${FORMAT2}'&#34;/g' ${PROP}
		</set>
	</action>
	<action shell="hidden">
		<title>生成图片格式</title>
		<param
			name="FORMAT"
			title="开启覆盖原图无效"
			options-sh="echo -e 'jpg\njpeg\npng\nraw'"/>
		<set>
			sed -i 's/^format3=.*/format3=&#34;'\${FORMAT}'&#34;/g' ${PROP}
		</set>
	</action>
	<action shell="hidden">
		<title>圆角值半径</title>
		<param
			name="ROUND"
			type="seekbar"
			min="1"
			max="100"
			value="${round}"/>
		<set>
			sed -i 's/^round=.*/round=&#34;'\${ROUND}'&#34;/g' ${PROP}
		</set>
	</action>
	<action shell="hidden">
		<title>原图在生成后的图片中占比</title>
		<param
			name="DIMEN"
			type="seekbar"
			min="1"
			max="100"
			value="${dimen%\%}"/>
		<set>
			sed -i 's/^dimen=.*/dimen=&#34;'\${DIMEN}'%&#34;/g' ${PROP}
		</set>
	</action>
	<action shell="hidden">
		<title>原图周围阴影颜色</title>
		<param
			name="COLOR"
			title="不允许透明度，设置透明度会自动删去，RRGGBB"
			type="color"
			value="${color}"/>
		<set>
			COLOR=#\${COLOR:0-6}
			sed -i 's/^color=.*/color=&#34;'\${COLOR}'&#34;/g' ${PROP}
		</set>
	</action>
	<action shell="hidden">
		<title>背景高斯模糊数值</title>
		<param
			name="BG"
			title="处理耗时长的根本原因，数值越小速度越快"
			type="seekbar"
			min="1"
			max="50"
			value="${bg##*x}"/>
		<set>
			sed -i 's/^bg=.*/bg=&#34;-blur 0x'\${BG}'&#34;/g' ${PROP}
		</set>
	</action>
	<action shell="hidden">
		<title>水印模板设置</title>
		<param
			name="WATERMARK"
			title="水印"
			type="text"
			value="
EOF
echo "${watermark}" | while read line
do
	[ -n "${line}" ] && echo "${line}&#x000A;"
done
cat <<-EOF
			"/>
		<set>
			if [ `sed -n '/^watermark=/p' ${PROP} | grep -o '&#34;' | wc -l` -gt 1 ]; then
				sed -i '/^watermark/d' ${PROP}
			else
				sed -i '/^watermark/,/&#34;/d' ${PROP}
			fi
			echo 'watermark=&#34;' > ${WM}
			echo &#34;\${WATERMARK}&#34; >> ${WM}
			echo '&#34;' >> ${WM}
			sed -i '/^$/d' ${WM}
			sed -i &#34;/^#水印标识行/r${WM}&#34; ${PROP}
			rm -f ${WM}
		</set>
	</action>
	<switch shell="hidden" reload="true">
		<title>水印实时刷新 费电还慢</title>
		<get>
			if [[ ${refresh} == yes ]]; then
				echo 1
			else
				echo 0
			fi
		</get>
		<set>
			if [ \${state} -eq 1 ]; then
				sed -i 's/^refresh=.*/refresh=&#34;yes&#34;/g' ${PROP}
			else
				sed -i 's/^refresh=.*/refresh=&#34;no&#34;/g' ${PROP}
			fi
		</set>
	</switch>
	<action shell="hidden">
		<title>水印位置</title>
		<param
			name="PLAN"
			title="水印内容对齐"
			value="${plan}">
			<option value="west">左侧对齐</option>
			<option value="center">水平居中</option>
			<option value="east">右侧对齐</option>
		</param>
		<param
			name="LOCATION"
			title="水印要添加的位置"
			value="${location}">
			<option value="northwest">左上</option>
			<option value="north">上中</option>
			<option value="northeast">右上</option>
			<option value="west">左中</option>
			<option value="center">正中</option>
			<option value="east">右中</option>
			<option value="southwest">左下</option>
			<option value="south">下中</option>
			<option value="southeast">右下</option>
		</param>
		<param
			name="H"
			title="水印到水平边缘的距离"
			type="seekbar"
			min="0"
			max="200"
			value="${range_h}"/>
		<param
			name="V"
			title="水印到垂直边缘的距离"
			type="seekbar"
			min="0"
			max="200"
			value="${range_v}"/>
		<set>
			sed -i 's/^plan=.*/plan=&#34;'\${PLAN}'&#34;/g' ${PROP}
			sed -i 's/^location=.*/location=&#34;'\${LOCATION}'&#34;/g' ${PROP}
			sed -i 's/^range_h=.*/range_h=&#34;'\${H}'&#34;/g' ${PROP}
			sed -i 's/^range_v=.*/range_v=&#34;'\${V}'&#34;/g' ${PROP}
			rm -f ${WM}
		</set>
	</action>
	<action shell="hidden">
		<title>单个水印最大宽高</title>
		<param
			name="DIMEN1"
			title="文字大小"
			type="seekbar"
			min="1"
			max="200"
			value="${wm_dimen}"/>
		<param
			name="DIMEN2"
			title="图片大小"
			type="seekbar"
			min="1"
			max="200"
			value="${wm_dimen2}"/>
		<set>
			sed -i 's/^wm_dimen=.*/wm_dimen=&#34;'\${DIMEN1}'&#34;/g' ${PROP}
			sed -i 's/^wm_dimen2=.*/wm_dimen2=&#34;'\${DIMEN2}'&#34;/g' ${PROP}
			rm -f ${WM}
		</set>
	</action>
	<action shell="hidden">
		<title>水印颜色</title>
		<param
			name="COLOR2"
			title="水印字体颜色，不允许透明度，设置透明度会自动删去，RRGGBB"
			type="color"
			value="${color2}"/>
		<param
			name="COLOR3"
			title="字体阴影颜色，不允许透明度，设置透明度会自动删去，RRGGBB"
			type="color"
			value="${color3}"/>
		<set>
			COLOR2=#\${COLOR2:0-6}
			COLOR3=#\${COLOR3:0-6}
			sed -i 's/^color2=.*/color2=&#34;'\${COLOR2}'&#34;/g' ${PROP}
			sed -i 's/^color3=.*/color3=&#34;'\${COLOR3}'&#34;/g' ${PROP}
			rm -f ${WM}
		</set>
	</action>
	<action shell="hidden">
		<title>水印字体</title>
		<param
			name="FONT"
			title="系统字体在/system/fonts下，可以手动输入"
			type="file"
			editable="true"
			value="${font}"/>
		<set>
			sed -i 's@^font=.*@font=&#34;'\${FONT}'&#34;@g' ${PROP}
		</set>
	</action>
</group>
<group>
	<text>
		<slice u="true" align="center" break="true" link="${MODURL}" size="20">点击获取${MODVERSION}版本下载链接&#x000A;其他版本设置出问题不负责</slice>
	</text>
</group>
EOF
