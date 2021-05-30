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
    init_data_MD5=57580d771a3cec502e23b5255ada6670
    Util_Functions_ID=Util_Functions.sh
    Util_Functions_MD5=1491433353ef757f6b4c261727086236
    Cloud_ID=Cloud_Page.zip
    Cloud_Version=2021052104
    Cloud_MD5=f77f2abfcfb4209dc79063c73fc768d7
