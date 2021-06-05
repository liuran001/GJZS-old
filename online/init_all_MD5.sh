# a() { md5sum < `pm path $Package_name | sed 's/.*://g'`; }
# 
# Canary=2021051501
# if [[ $Version_code -eq $Canary ]]; then
    # if [[ `a` != 779dd22b55d0fbec37462bfe64582b6a* ]]; then
        # echo "！盗版软件，已触发自动卸载"
        # pm uninstall $Package_name
        # exit 1
    # fi
# fi
    init_data_ID=init_data.sh
    init_data_MD5=716d053d626333c8d0e991bce2099276
    Util_Functions_ID=Util_Functions.sh
    Util_Functions_MD5=d2ea14506652bab47ec514344019ace2
    Cloud_ID=Cloud_Page.zip
    Cloud_Version=2021060302
    Cloud_MD5=81c48908d67c9803d99894ebb5de6b53
