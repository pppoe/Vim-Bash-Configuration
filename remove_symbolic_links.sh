#! /bin/bash

if [ $# -lt 1 ]; then
    echo "Usage: ./path/to/this/script path/to/Vim-Bash-Configuration/"
    exit
fi

## Make CONFIG_DIR to be absolute path
CONFIG_DIR=$1
if [ ! -z "${CONFIG_DIR%%/*}" ]; then
    CONFIG_DIR=$PWD/$1
fi

if [ ! -d "$CONFIG_DIR" ]; then
    echo "Error: $CONFIG_DIR not exists"
    exit
fi

LIST=("$PWD/.bashrc" "$PWD/.vimrc" "$PWD/.vim" "$PWD/.tmux.conf" "$PWD/.pythonstartup")
# Check current directory
if [ "$PWD" = "$HOME" ]; then
    for f in ${LIST[@]}
    do
        if [ -L $f ]; then
            rm -fv $f
        fi
    done
else
    echo "Usage: this is only expected to be called from $HOME"
fi
