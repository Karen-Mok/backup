#! /bin/bash

declare -A coms

coms=([vnc]="x11vnc -display :0 -forever -shared -rfbauth ~/.vnc/passwd" 
      [fm]="filebrowser -a [`ifconfig | grep 2001 | cut -d ' ' -f 10`] -p 2333 -r /media/mogician"
      [jn]="jupyter notebook --ip=`ifconfig | grep 2001 | cut -d ' ' -f 10` 2>jn.log"
     )
     
for i in vnc fm jn
do
    tmux new -s "$i" -d
    tmux send -t "$i" "${coms[$i]}" Enter 
done

sleep 1

cat jn.log | grep ^[[:blank:]].*2001 | sed -r 's/http:\/\/(.*):8888/[\1]:8888/'
