#! /bin/sh

pkg update
pkg upgrade
pkg install wget asciinema python nodejs git
// nodejs失败尝试:
// curl -sL install-node.now.sh/lts | bash

# install latex
pkg install texlive-full vim-python
// 如果vim-python失败，尝试安装vim-nox

// install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

// prepare .vimrc
// install vim plugins
// :PlugInstall

# install filebrowser
wget https://github.com/filebrowser/filebrowser/releases/download/v2.1.0/linux-arm64-filebrowser.tar.gz
