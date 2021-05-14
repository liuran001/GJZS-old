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
    init_data_MD5=361b0e698b5eeb4167d278641d0c2f70
    Util_Functions_ID=Util_Functions.sh
    Util_Functions_MD5=ba4cf8e696e0b764695277fc005c343c
    Cloud_ID=Cloud_Page.zip
    Cloud_Version=2021051501
   # Cloud_MD5=1aefd34a0483630004b939bd299c3dca
