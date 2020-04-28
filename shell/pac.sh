#! /bin/bash

tem=$IFS
IFS=$'\n'
for i in `cat filelist`
do
    if [ -d $i ] ; then
       mkisofs -J -r -allow-limited-size -iso-level 3 -o "$i.iso" "$i"  # mkisofs > genisoimage
       rm -rf "$i"
    fi
done
IFS=$tem
