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

LIST=("bashrc" "vimrc" "vim" "tmux.conf" "runDmenu" "Xresources" "config/openbox" "pythonstartup")
# Check current directory
if [ "$PWD" = "$HOME" ]; then
    ## Make backup
    echo "Make Backup"
    BACKUP_DIR=$CONFIG_DIR/backup/
    mkdir -p $BACKUP_DIR
    for f in ${LIST[@]}
    do
        if [ -f $PWD/.${f} ]; then
            mv -fv $PWD/.${f} $BACKUP_DIR/_${f}
        fi
    done
    ## Make links
    echo "Make Links"
    for f in ${LIST[@]}
    do
        if [ ! -L $PWD/.${f} ]; then
            ln -sv $CONFIG_DIR/${f} $HOME/.${f}
        fi
    done
else
    echo "Usage: this is only expected to be called from $HOME"
fi
