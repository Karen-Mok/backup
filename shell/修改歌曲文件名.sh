#! /bin/bash

temp=$IFS
IFS=$'\n'

for i in `ls`
do
    fn=`echo $i | sed -r  's/[0-9]{2} //'`
    echo $i
    echo $fn
done

IFS=$temp
