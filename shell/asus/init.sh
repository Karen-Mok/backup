#! /bin/bash
sudo sed -i -r '21 s/#(.*)no/\1yes/' /etc/ssh/ssh_config  #修改ssh配置文件，转发远程x界面
sudo apt update
sudo apt install -y  xvnc4viewer   # net-tools
#sudo apt install gedit gedit-plugins 
