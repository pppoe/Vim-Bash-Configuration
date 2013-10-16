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

# Check current directory
if [ "$PWD" = "$HOME" ]; then
    if [ -L $PWD/.bashrc ]; then
        rm -fv $PWD/.bashrc
    fi
    if [ -L $PWD/.vimrc ] ; then
        rm -fv $PWD/.vimrc
    fi
    if [ -L $PWD/.vim ]; then
        rm -fv $PWD/.vim
    fi
else
    echo "Usage: this is only expected to be called from $HOME"
fi
