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
    init_data_MD5=6f5c1f8256926a8a590b615396755da1
    Util_Functions_ID=Util_Functions.sh
    Util_Functions_MD5=d6d598cc84e4ef662430fcec145f46e5
    Cloud_ID=Cloud_Page.zip
    Cloud_Version=2021060903
    Cloud_MD5=8afd83d84db962ae2d34c477b04f168a
