#! /bin/bash 

num=1024

tem=$IFS
IFS=$'\n'
for i in `cat filelist | grep 233`
do
    axel -a -n 10 "$i" -o "${num}.iso"
    
    ./BaiduPCS-Go u "${num}.iso" / --norapid
    
    if ./BaiduPCS-Go ls / | grep "${num}.iso" ; then
        rm -f "${num}.iso"
        echo "${num}.iso 上传成功">>success
        let num++
    else
        exit
    fi
done
IFS=$tem
