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
    init_data_MD5=19da1225ef1b9d14aff4a068359ad6ab
    Util_Functions_ID=Util_Functions.sh
    Util_Functions_MD5=e00ca784d2d14bbb84e0d15f54169d5f
    Cloud_ID=Cloud_Page.zip
    Cloud_Version=2021053102
    Cloud_MD5=64598157066d4f7f7245da1d883a549a
