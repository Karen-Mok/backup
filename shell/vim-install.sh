sudo apt update
sudo apt install -y wget curl git clangd vim-gtk3 build-essential

wget https://raw.githubusercontent.com/Karen-Mok/backup/master/.vimrc
curl -o .vim/colors/monokai.vim --create-dirs https://raw.githubusercontent.com/Karen-Mok/backup/master/monokai.vim

install_nodejs()
{
    curl -fsSL https://deb.nodesource.com/setup_16.x | sudo bash -
    sudo apt-get install -y nodejs
}


lsb_release -d | grep deepin
if [ $? -eq 0 ]
then
    echo "Deepin 系统需要修改/usr/lib/os-release伪装成debian才能安装nodejs" 
    sudo cp /usr/lib/os-release /usr/lib/os-release.back
    sudo sed -i -e '/^ID/ s/Deepin/Debian/; /^VERSION=/ s/^.*$/VERSION_CODENAME=\"buster\"/' /usr/lib/os-release
    install_nodejs
    sudo cp /usr/lib/os-release /usr/lib/os-release.debian
    sudo cp /usr/lib/os-release.back /usr/lib/os-release
else
    install_nodejs
fi

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c 'PlugInstall|q'
