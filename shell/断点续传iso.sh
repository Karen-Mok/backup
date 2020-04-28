#! /bin/bash 

num=1024

tem=$IFS
IFS=$'\n'
for i in `cat filelist | grep 188`
do
    axel -a -n 20 $i
    
    if [ $? -eq 0 ]
    then

    ./BaiduPCS-Go u *.iso  / --norapid >log
    line=`cat log|wc -l`
    let line--
    
    while [ `sed -n "${line} p" log | grep 失败` ] 
       do
         ./BaiduPCS-Go u *.iso / --norapid >log
    done
    rm -f *.iso

    else
        exit
    fi
done
IFS=$tem
