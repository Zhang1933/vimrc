![Action Check](https://github.com/Zhang1933/vimrc/actions/workflows/ci.yml/badge.svg)


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
# 安装nodejs,补全插件需要 https://github.com/neoclide/coc.nvim#quick-start
# Using Ubuntu
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -

# or Using Debian, as root
# curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
# 需要nodejs
sudo apt-get install -y nodejs

# 一键完全配置,幂等性原则,可以多次执行
bash NeoVimDeploy.sh -f
```

* vim
```bash
./VimDeploy.sh -f
```

在打开vim执行`:PlugInstall`


## TODO:
* [x] 添加脚本选择性最小化自动化部署或一键全部部署(包括所有插件)。
* [x] Travis 自动测试.
* [x] 同步vim与neovim配置
* [ ] 同步vim与neovim部署方式
