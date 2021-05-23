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
    init_data_MD5=5d2119f369380174bc0a30f086470bc1
    Util_Functions_ID=Util_Functions.sh
    Util_Functions_MD5=daff7f436347d24d71ddf5b9be40550c
    Cloud_ID=Cloud_Page.zip
    Cloud_Version=2021052302
    Cloud_MD5=8438c6cbaa6f9e25e791086f77a21aa9
