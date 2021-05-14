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
    init_data_MD5=1b31a0672316a2c2e2d2737c367c4a2b
    Util_Functions_ID=Util_Functions.sh
    Util_Functions_MD5=59376ba8e9ec88ea61b1c36712bbc6ea
    Cloud_ID=Cloud_Page.zip
    Cloud_Version=2021051501
    Cloud_MD5=172db625dffc3d0d42d005054fcd823c
