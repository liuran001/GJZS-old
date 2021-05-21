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
    init_data_MD5=f2d5f0b6e81c5bb71ae665eddb7dada3
    Util_Functions_ID=Util_Functions.sh
    Util_Functions_MD5=daff7f436347d24d71ddf5b9be40550c
    Cloud_ID=Cloud_Page.zip
    Cloud_Version=2021052201
    Cloud_MD5=ef56f24062a2edda0002d6bc0df325b9
