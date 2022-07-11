#! /bin/sh

apt update
apt install -y unzip axel tmux transmission-daemon apache2 lynx

service transmission-daemon stop  # 配置 transmission,在调用脚本之前记得传参作为密码
mkdir -p /home/transmission/downloads
mkdir -p /home/transmission/tmp
chmod -R 777 /home/transmission/
mv /etc/transmission-daemon/settings.json /etc/transmission-daemon/settings.json.backup
wget https://raw.githubusercontent.com/Karen-Mok/backup/master/%E5%85%B6%E4%BB%96%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6/settings.json
sed  -i '51 s/\"\"/\"'${1}'\"/g' settings.json    #参数为密码,bash init.sh password
mv settings.json /etc/transmission-daemon/
wget https://github.com/ronggang/transmission-web-control/raw/master/release/install-tr-control-cn.sh 
cd /usr/share/transmission/web
mv index.html index.origin.html
mv ~/install-tr-control-cn.sh .
bash install-tr-control-cn.sh        # 这里要选择,输入1,回车
cd ~
service transmission-daemon start


wget https://raw.githubusercontent.com/Karen-Mok/backup/master/shell/aria2.sh   # 下载aria2.sh 但不安装
wget -N --no-check-certificate "https://github.com/mayswind/AriaNg/releases/download/0.4.0/aria-ng-0.4.0.zip" 
# 下载AriaNg
rm -f /var/www/html/*
mv aria-ng-0.4.0.zip /var/www/html/
cd /var/www/html
unzip aria-ng-0.4.0.zip
cd ~

wget https://github.com/cjbassi/gotop/releases/download/3.0.0/gotop_3.0.0_linux_amd64.tgz
tar -xvzf gotop_3.0.0_linux_amd64.tgz

echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf    # 启用Google BBR加速网络
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sysctl -p

#wget https://github.com/iikira/BaiduPCS-Go/releases/download/v3.5.6/BaiduPCS-Go-v3.5.6-linux-amd64.zip
#unzip BaiduPCS-Go-v3.5.6-linux-amd64.zip
#mv BaiduPCS-Go-v3.5.6-linux-amd64/BaiduPCS-Go .    #原版本已经不可用,上传有问题会失败

wget https://github.com/qjfoidnh/BaiduPCS-Go/releases/download/v3.8.7/BaiduPCS-Go-v3.8.7-linux-amd64.zip
unzip BaiduPCS-Go-v3.8.7-linux-amd64.zip

wget https://github.com/tickstep/cloudpan189-go/releases/download/v0.1.1/cloudpan189-go-v0.1.1-linux-amd64.zip
unzip cloudpan189-go-v0.1.1-linux-amd64.zip

wget https://github.com/tickstep/aliyunpan/releases/download/v0.1.8/aliyunpan-v0.1.8-linux-amd64.zip
unzip aliyunpan-v0.1.8-linux-amd64.zip

echo "export PATH=/root/:$PATH" >> /etc/profile
source /etc/profile

#echo '/dev/vdb1 /home/transmission/downloads ext4   defaults    0  0' >> /etc/fstab   
#mount -a

mkdir /var/www/html/pt
ln -s /home/transmission/downloads /var/www/html/pt
