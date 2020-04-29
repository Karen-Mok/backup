#! /bin/sh

pkg update
pkg upgrade
pkg install wget asciinema python nodejs git python3-pygments python3-pip
// nodejs失败尝试:
// curl -sL install-node.now.sh/lts | bash

# install latex
pkg install texlive-full vim-python
pip3 install unidecode
// 如果vim-python失败，尝试安装vim-nox

// install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

// prepare .vimrc
// install vim plugins
// :PlugInstall

// 需要.latexmkrc
// 编译Tang那个还需要zhmCJK包，合并ttf等
//git clone https://github.com/Karen-Mok/backup.git

//sudo mkdir /usr/share/fonts/mydownload
//sudo mv backup/ttf/* /usr/share/fonts/mydownload

// dir=/usr/share/texmf/
// texlivedir=/usr/share/texlive/texmf-dist/fonts/map/fontname

// sudo cp -r backup/zhmCJK $dir
// cd $dir

//sudo mkdir -p doc/latex/zhmCJK
// sudo mkdir -p source/latex/zhmCJK
//sudo mkdir -p tex/latex/zhmCJK
// sudo mkdir -p fonts/tfm/zhmCJK/

// sudo mv zhmCJK/doc/* doc/latex/zhmCJK
//sudo mv zhmCJK/README doc/latex/zhmCJK

//sudo mv zhmCJK/source/zhmCJK.* source/latex/zhmCJK

//sudo mv zhmCJK/tex/zhmCJK.sty tex/latex/zhmCJK

// sudo mv zhmCJK/tfm/zhmCJK.tfm fonts/tfm/zhmCJK/

// sudo mv zhmCJK/fontname/zhmCJK.map $texlivedir
// cd $texlivedir
// 因为sudo权限不够，需要login with su
// cp texfonts.map texfonts.map.backup
// cat zhmCJK.map >>texfonts.map
// exit su

// sudo texhash
// 注意此时目录位置

# install filebrowser
wget https://github.com/filebrowser/filebrowser/releases/download/v2.1.0/linux-arm64-filebrowser.tar.gz
