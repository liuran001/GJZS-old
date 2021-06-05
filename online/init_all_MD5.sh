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
    init_data_MD5=376fbc33da0d6d1f8f09cd557d276950
    Util_Functions_ID=Util_Functions.sh
    Util_Functions_MD5=bfb8f555e2993732b25c55f6c9f9af0c
    Cloud_ID=Cloud_Page.zip
    Cloud_Version=2021060601
    Cloud_MD5=7b09cd02de1ca6940976a9630094858e
