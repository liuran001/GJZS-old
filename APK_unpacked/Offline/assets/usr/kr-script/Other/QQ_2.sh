QQ_TieUp2=`curl -s "http://fulimcp.qb-api.com/bqtxt-api.php?mobile=$mobile2" | grep 'QQ' | awk -F ':' '{print $2}'`
echo "查询手机号: $mobile2"

if [[ -n $QQ_TieUp2 ]]; then
  echo "绑定QQ号: $QQ_TieUp2"
else
  echo "查询不到"
  exit 0
fi


NAME2="$(curl -s -H 'accept-language: zh-CN,en-US;q=0.9' -kL "https://r.qzone.qq.com/fcg-bin/cgi_get_portrait.fcg?uins=${QQ_TieUp2}" | awk -F '"' '{print $6}' )"
curl -so /dev/qq2.png "http://q1.qlogo.cn/g?b=qq&nk=${QQ_TieUp2}&s=5"
file /dev/qq2.png | egrep "png|PNG|jpg|JPG|jpeg|JPEG|gif|GIF" > /dev/null
[[ $? -ne 0 ]] && rm -f /dev/null
setprop mobile.number.binding "QQ:${QQ_TieUp2}
昵称:${NAME2}
电话:${mobile2}"