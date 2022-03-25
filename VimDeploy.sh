#!/usr/bin/env bash

#src="$HOME/.vim"
#if [ -d $src ]; then
#    echo ".vim director already exitst,backup"
#   mv $src  "${src}.bak" 
#fi

mkdir -p ~/.config/
cp --backup=t -r nvim ~/.config/
cp --backup=t ./nvim/init.vim ~/.vimrc
# 最小化部署：
sed -i '/vim-plug/ s/^/"/' ~/.vimrc
