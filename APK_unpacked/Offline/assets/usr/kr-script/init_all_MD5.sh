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
    init_data_MD5=c67b6a47b7702a7f9f8831f61a717c1d
    Util_Functions_ID=Util_Functions.sh
    Util_Functions_MD5=ef518b7ceb042bd7b69fc17dc5e417c8
    Cloud_ID=Cloud_Page.zip
    Cloud_Version=2021060602
    Cloud_MD5=''
