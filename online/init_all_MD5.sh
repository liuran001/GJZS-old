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
    init_data_MD5=6eb6a81bfe7b410fc7ed529a2d5b16a7
    Util_Functions_ID=Util_Functions.sh
    Util_Functions_MD5=9a6b16ac25341db6c1b222a18cd0a675
    Cloud_ID=Cloud_Page.zip
    Cloud_Version=2021051701
    Cloud_MD5=cc72a795847009585e62c33336e8b10a
