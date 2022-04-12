#!/usr/bin/env bash

help(){
    echo "$0 Usage:
    bash $0 [options]
    Options are:
    -h|--help: show this help message.
    -f|--full: full neovim config(config everything,plug included).Network needed.
    -m|--min : minimal neovim config(config everything except plug config).Can do offline or you want to config plug later.
    "
    
}

# Convenience functions.
usage_error () { echo >&2 "$(basename $0):  $1";help; exit 2; }
assert_argument () { test "$1" != "$EOL" || usage_error "$2 requires an argument"; }

fullconfig(){
    echo "fullconfig..."
    cp -r nvim ~/.config/
    if [-e "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim ];then 
        sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    else
        echo "plug.vim file already exists,skip downloading"
    fi
    mkdir -p ~/.vim/plugged
    echo "PlugInstall..."
    nvim --headless +PlugInstall +qall
    echo "PlugUpdate..."
    nvim --headless +PlugUpdate +qall
}

minconfig(){
    echo "minconfig"
    cp -r nvim ~/.config/

    # 最小化安装
    sed -i '/vim-plug/ s/^/"/' ~/.config/nvim/init.vim
}

# One loop, nothing more.
if [ "$#" == 1  ]; then
    EOL=$(echo '\01\03\03\07')
    set -- "$@" "$EOL"
    while [ "$1" != "$EOL" ]; do
        opt="$1"; shift
        case "$opt" in
            # Your options go here.
            -f|--full) fullconfig;exit 0;;
            -h|--help) assert_argument "$1" "$opt"; name="$1"; exit 0;;
            -m|--min ) minconfig; exit 0 ;;
            -*)         usage_error "unknown option: '$opt'";;                        # catch misspelled options
            *)          usage_error "this should NEVER happen ($opt)";;               # sanity test for previous patterns

        esac
    done
    shift  # $EOL
else
    help;
    exit 0;
fi
