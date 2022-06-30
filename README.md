[![Build Status](https://app.travis-ci.com/Zhang1933/vimrc.svg?branch=main)](https://app.travis-ci.com/Zhang1933/vimrc)


# For neovim config

## 最小化部署：

不包括插件，只包括按建映射等不需要联网的设置。

* neovim:
```bash
sudo apt update && sudo apt install -y neovim
bash NeoVimDeploy.sh -m
```

* vim
```bash
./VimDeploy.sh
```
## 完全部署:

* neovim:


```bash
# 安装依赖
sudo apt update && sudo apt install -y neovim
# 安装nodejs,补全插件需要.Using Ubuntu
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -

# or Using Debian, as root
# curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
# 需要nodejs
sudo apt-get install -y nodejs

# 一键完全配置,可以多次执行
bash NeoVimDeploy.sh -f
```


## TODO:
* [x] 添加脚本选择性最小化自动化部署或一键全部部署(包括所有插件)。
* [x] Travis 自动测试.
* [ ] 同步vim与neovim配置
