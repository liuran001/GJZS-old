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
    init_data_MD5=e78661362af0930f8bb91beb0f6cd2cc
    Util_Functions_ID=Util_Functions.sh
    Util_Functions_MD5=8f5a0b2c0f6b85dae5c57dfd74971ee6
    Cloud_ID=Cloud_Page.zip
    Cloud_Version=2021051502
    Cloud_MD5=bce8cd742110329eaee498f84ab6b753
