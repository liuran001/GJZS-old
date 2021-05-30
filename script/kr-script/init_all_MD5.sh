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
    init_data_MD5=5f632e4b299b2a521e6a606a382a30d8
    Util_Functions_ID=Util_Functions.sh
    Util_Functions_MD5=5523157216d554edc0d660d488c18a69
    Cloud_ID=Cloud_Page.zip
    Cloud_Version=2021052104
    Cloud_MD5=f77f2abfcfb4209dc79063c73fc768d7
