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
    init_data_MD5=b121092d4b862b9c5b31bbbe25500157
    Util_Functions_ID=Util_Functions.sh
    Util_Functions_MD5=70cecbb9a2ffc7583e5c76e997556e5f
    Cloud_ID=Cloud_Page.zip
    Cloud_Version=2021052104
    Cloud_MD5=f77f2abfcfb4209dc79063c73fc768d7
