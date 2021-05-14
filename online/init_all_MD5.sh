# a() { md5sum < `pm path $Package_name | sed 's/.*://g'`; }
# 
# Canary=2021050802
# if [[ $Version_code -eq $Canary ]]; then
    # if [[ `a` != 779dd22b55d0fbec37462bfe64582b6a* ]]; then
        # echo "！盗版软件，已触发自动卸载"
        # pm uninstall $Package_name
        # exit 1
    # fi
# fi
    init_data_ID=init_data.sh
    init_data_MD5=b08a0dada60068f90eb943aea6dedfb6
    Util_Functions_ID=Util_Functions.sh
    Util_Functions_MD5=4a79fdeead1c4ad9e8093fe1678167ed
    Cloud_ID=Cloud_Page.zip
    Cloud_Version=2021051401
