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
    ## Make backup
    BACKUP_DIR=$CONFIG_DIR/backup/
    mkdir -p $BACKUP_DIR
    if [ -f $PWD/.bashrc ]; then
        mv -v $PWD/.bashrc $BACKUP_DIR/_bashrc
    fi
    if [ -f $PWD/.vimrc ] ; then
        mv -v $PWD/.vimrc $BACKUP_DIR/_vimrc
    fi
    if [ -d $PWD/.vim ]; then
        mv -v $PWD/.vim $BACKUP_DIR/_vim
    fi
    ## Make links
    ln -sv $CONFIG_DIR/vimrc $HOME/.vimrc
    ln -sv $CONFIG_DIR/vim $HOME/.vim/
    ln -sv $CONFIG_DIR/bashrc $HOME/.bashrc
else
    echo "Usage: this is only expected to be called from $HOME"
fi
