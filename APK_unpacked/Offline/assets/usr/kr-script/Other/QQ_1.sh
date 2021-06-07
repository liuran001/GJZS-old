QQ_TieUp=`curl -X GET -sv "http://fulimcp.qb-api.com/qb-api.php?mod=cha&qq=$QQ" 2>&1 | grep '"mobile"' | awk -F ': ' '{print $2}' | awk -F '"' '{print $2}'`
echo "查询QQ号: $QQ"

if [[ -n $QQ_TieUp ]]; then
  echo "绑定手机号: $QQ_TieUp"
else
  echo "查询不到"
  exit 0
fi


NAME="$(curl -s -H 'accept-language: zh-CN,en-US;q=0.9' -kL "https://r.qzone.qq.com/fcg-bin/cgi_get_portrait.fcg?uins=${QQ}" | awk -F '"' '{print $6}' )"
curl -so /dev/qq1.png "http://q1.qlogo.cn/g?b=qq&nk=${QQ}&s=5"
file /dev/qq1.png | egrep "png|PNG|jpg|JPG|jpeg|JPEG|gif|GIF" > /dev/null
[[ $? -ne 0 ]] && rm -f /dev/null
setprop qq.number.binding "QQ:${QQ}
昵称:${NAME}
电话:${QQ_TieUp}"