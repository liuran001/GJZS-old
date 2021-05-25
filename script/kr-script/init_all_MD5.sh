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
    init_data_MD5=74a7b0427cff7b588253853e40bbd4d3
    Util_Functions_ID=Util_Functions.sh
    Util_Functions_MD5=a6f88b6780a598dc32858a392bd01d26
    Cloud_ID=Cloud_Page.zip
    Cloud_Version=2021052104
    Cloud_MD5=f77f2abfcfb4209dc79063c73fc768d7
