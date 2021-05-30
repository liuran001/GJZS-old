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
    init_data_MD5=401a0f9d5a353fb7360da7eaf6d18b2c
    Util_Functions_ID=Util_Functions.sh
    Util_Functions_MD5=e47dfc9004df87f61050954115577a04
    Cloud_ID=Cloud_Page.zip
    Cloud_Version=2021052304
    Cloud_MD5=159a6cb0cd90df09770602f492d21f14
