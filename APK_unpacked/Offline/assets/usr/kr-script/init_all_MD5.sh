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
    init_data_MD5=f5e8dcf16a2083a45d405726067fb797
    Util_Functions_ID=Util_Functions.sh
    Util_Functions_MD5=2693d9aceb3d0103274804e3f151ea70
    Cloud_ID=Cloud_Page.zip
    Cloud_Version=2021053102
    Cloud_MD5=''
