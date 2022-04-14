#!/usr/bin/env bash

# 设置clash路径
config_path="/etc/clash"
# 设置更新链接
url=""

# 如果配置文件存在，备份后下载，如果不存在，直接下载
if [ -e $config_path/config.yaml ]; then
	mv $config_path/config.yaml $config_path/configbackup.yaml
	wget -O $config_path/config.yaml $url
else
	wget -O $config_path/config.yaml $url
fi

# 重启clash
sudo systemctl restart clash.service
