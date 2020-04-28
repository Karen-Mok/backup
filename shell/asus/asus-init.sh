#! /bin/bash
#本脚本未经过测试,慎用
sudo sed -i -r '21 s/#(.*)no/\1yes/' /etc/ssh/ssh_config  #修改ssh配置文件，转发远程x界面

sudo mv /etc/apt/sources.list /etc/apt/sources.list.backup
sudo echo "
#清华源
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ disco main restricted universe multiverse
#deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ disco main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ disco-updates main restricted universe multiverse
#deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ disco-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ disco-backports main restricted universe multiverse
#deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ disco-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ disco-security main restricted universe multiverse
#deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ disco-security main restricted universe multiverse


#阿里云源
deb http://mirrors.aliyun.com/ubuntu/ disco main restricted universe multiverse
#deb-src http://mirrors.aliyun.com/ubuntu/ disco main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ disco-security main restricted universe multiverse
#deb-src http://mirrors.aliyun.com/ubuntu/ disco-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ disco-updates main restricted universe multiverse
#deb-src http://mirrors.aliyun.com/ubuntu/ disco-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ disco-backports main restricted universe multiverse
#deb-src http://mirrors.aliyun.com/ubuntu/ disco-backports main restricted universe multiverse

#中科大源
deb https://mirrors.ustc.edu.cn/ubuntu/ disco main restricted universe multiverse
#deb-src https://mirrors.ustc.edu.cn/ubuntu/ disco main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu/ disco-updates main restricted universe multiverse
#deb-src https://mirrors.ustc.edu.cn/ubuntu/ disco-updates main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu/ disco-backports main restricted universe multiverse
#deb-src https://mirrors.ustc.edu.cn/ubuntu/ disco-backports main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu/ disco-security main restricted universe multiverse
#deb-src https://mirrors.ustc.edu.cn/ubuntu/ disco-security main restricted universe multiverse
">/etc/apt/sources.list

sudo apt update
sudo apt install -y  xvnc4viewer xfce4-terminal gedit gedit-plugins tmux   # net-tools

mkdir .vim
mkdir .vim/colors/
mv monokai.vim .vim/colors/   #把主题文件准备好
echo "
:set number
:set hlsearch
:syntax enable
:syntax on
colorscheme monokai
set expandtab
:%ret! 4
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent
"

tar -xvzf ittu_bottom.tar.gz #登录主题,测试命令:sddm-greeter --test-mode --theme /path/to/theme
sudo mv ittu_bottom /usr/share/sddm/themes/
sudo sed '332 s/B/\/\/B/'  /usr/share/sddm/themes/ittu_bottom/Main.qml
sudo echo "
[Theme]
Current=ittu_bottom
">>/etc/sddm.conf

unzip Arc_OSXbuttons.zip  #openbox窗口主题,注意要在 首选项-LXQt设置-openbox设置-主题中选择 才能生效
sudo mv Arc_OSX /usr/share/themes/

sudo mv /usr/share/plymouth/themes/lubuntu-logo/lubuntu_logo.png /usr/share/plymouth/themes/lubuntu-logo/old_lubuntu_logo.png
mv fei.png /usr/share/plymouth/themes/lubuntu-logo/lubuntu_logo.png    #修改开机动画,fei.png为哆啦A梦图片
sudo update-initramfs -u

reboot
