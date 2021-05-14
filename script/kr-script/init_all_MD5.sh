a() { md5sum < `pm path $Package_name | sed 's/.*://g'`; }

Canary=2021050802
if [[ $Version_code -eq $Canary ]]; then
    if [[ `a` = 0 ]]; then
        exit 1
    fi
fi
    init_data_ID=init_data.sh
    init_data_MD5=55f69445fc51f53689e4ccbc8e0521e9
    Util_Functions_ID=Util_Functions.sh
    Util_Functions_MD5=4a79fdeead1c4ad9e8093fe1678167ed
    Cloud_ID=Cloud_Page.zip
    Cloud_Version=2021050815
