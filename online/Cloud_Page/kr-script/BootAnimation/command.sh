#!/system/bin/sh
FILE="/data/adb/bootanimation_make"
FFMPEG="$PREFIX/ffmpeg"
FFMPEGMD5="efab65c8885bd5594996d41fd5d13b1b"
mkdir -p $FILE
if [[ ! -f $FFMPEG ]]
then
	echo "--联网下载ffmpeg，稍等"
	cd $FILE
	curl -O https://od.qqcn.site/Other/ffmpeg/ffmpeg.a[a-u]?raw
	cat ffmpeg.a* > ffmpeg
	cp -f ffmpeg $FFMPEG
	cd - > /dev/null
fi

md5sum $FFMPEG | grep $FFMPEGMD5 > /dev/null
[[ $? -eq 0 ]] || (echo "ffmpeg下载出现问题，返回重新下载" && rm -f $FFMPEG)

chmod 777 $FFMPEG
alias ffmpeg=$FFMPEG