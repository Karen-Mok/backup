#! /bin/bash

tem=$IFS
IFS=$'\n'
for i in `ls *.mp4`
do
    upname=`echo ${i:0:-4}| tr -t [a-z] [A-Z]` #截去后缀.mp4并把文件名转为大写
    zip -0 "${upname}.zip" "$i"
    if [ $? -eq 0 ] ; then
       rm -f "${i}"
    else
       rm -f "${upname}.zip"
       break
    fi
done
IFS=$tem
BaiduPCS-Go u *.zip /
