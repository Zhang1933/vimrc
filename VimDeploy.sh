#!/usr/bin/env bash

#src="$HOME/.vim"
#if [ -d $src ]; then
#    echo ".vim director already exitst,backup"
#   mv $src  "${src}.bak" 
#fi

#全量部署

mkdir -p ~/.config/
cp --backup=t -r nvim ~/.config/
cp --backup=t ./nvim/init.vim ~/.vimrc

if [ $# -eq 0 ]; then
    echo "跳过插件安装,最小化部署"
    sed -i '/vim-plug/ s/^/"/' ~/.vimrc
else
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
