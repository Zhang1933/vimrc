#!/usr/bin/env bash

cp -r nvim ~/.config/
# 最小化安装
sed -i '/vim-plug/ s/^/"/' ~/.config/nvim/init.vim
