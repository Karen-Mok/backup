# termux 安装运行aria2和caddy脚本

function install() {       # 安装 caddy和aria2

sudo apt install -y wget unzip aria2 tmux   # 安装软件包

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


# 提示信息及选项
function hint() {
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
}

function vim() {
    sudo apt install -y vim-nox vim-python git
    curl -sL install-node.now.sh/lts | sudo bash  # install node.js
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    # wget .vimrc
    # run :PlugInstall to install vim plugins
}

function latex() {
    sudo apt install -y texlive-full xdotool #texstudio 
    # install xdotool to fix vimtex-zathura error
    # wget .latexmkrc
}

function pixelbook() {
    sudo apt install -y tmux gvim fctix fcitx-lib* tigervnc-viewer vlc qbittorrent inkscape 
    # pixelbook用vim输入中文选项会乱，用gvim就OK
}

sudo apt update && sudo apt upgrade
sudo apt install -y python3 python3-pip
