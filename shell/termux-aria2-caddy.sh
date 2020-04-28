# termux 安装运行aria2和caddy脚本

function install() {       # 安装 caddy和aria2

pkg install wget unzip aria2 tmux   # 安装软件包

wget -qO- https://getcaddy.com | bash -s personal

wget https://github.com/mayswind/AriaNg-DailyBuild/archive/master.zip
unzip master.zip
mv AriaNg-DailyBuild-master AriaNg
#rm master.zip

echo ":8080 {
root /data/data/com.termux/files/home/AriaNg
gzip
}" >Caddyfile

}


function start() {  # 启动caddy和aria2
nowuser=`whoami`  # 当前用户
declare -A coms

coms=([aria2]="aria2c --enable-rpc --rpc-listen-all=true --rpc-allow-origin-all -c" 
      [caddy]="caddy"
     )
     
for i in aria2 caddy
do
    tmux new -s "$i" -d
    tmux send -t "$i" "${coms[$i]}" Enter 
done

echo "---------------------------------------------------"
echo "|                                                 |"
echo "|                                                 |"
echo "|    已以 $nowuser 用户启动 caddy 和 aria2        |"
echo "|                                                 |"
echo "| 若想修改下载目录为sdcard,需要以root用户执行脚本 |"
echo "|                                                 |"
echo "|          AriaNg地址  ip:8080                    |"
echo "|                                                 |"
echo "---------------------------------------------------"

}


# 主函数
echo 
echo "先安装caddy&aria2再启动,输入1"
echo "甭废话了直接启动,输入2"
echo -n "选一个呗:  "
read mychose
if [ $mychose -eq 1 ]
then

    install
    start
fi

if [ $mychose -eq 2 ]
then
    start
fi
