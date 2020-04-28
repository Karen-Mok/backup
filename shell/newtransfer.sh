#! /bin/bash 

num=1024

tem=$IFS
IFS=$'\n'
for i in `cat filelist | grep 188`
do
    axel -a -n 10 $i

    ./BaiduPCS-Go u *.iso *.txt / --norapid
    
    #if ./BaiduPCS-Go ls / | grep '$i' ; then
         rm -f *.iso *.txt
    #else
    #    exit
    #fi
done
IFS=$tem
