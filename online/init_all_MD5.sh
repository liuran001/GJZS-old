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
    init_data_MD5=8fc4320a21c220782b748d88b0b1faaf
    Util_Functions_ID=Util_Functions.sh
    Util_Functions_MD5=220f706b36777adb51df9cd2de015ba2
    Cloud_ID=Cloud_Page.zip
    Cloud_Version=2021053103
    Cloud_MD5=7cd3a50189574c893a9ff6583dfdf88f
