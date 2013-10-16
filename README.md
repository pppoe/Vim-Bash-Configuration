Vim-Bash-Configuration
======================

These are my Vim/Bash configuration files, put them here for my own favor.

# To deploy

previous ~/.vimrc ~/.vim ~/.bashrc will be copied to ./Vim-Bash-Configuration/backup/

```
    git clone https://github.com/pppoe/Vim-Bash-Configuration
    cd Vim-Bash-Configuration
    git submodule init
    git submodule update
    cd ..
    ./Vim-Bash-Configuration/make_symbolic_links.sh ./Vim-Bash-Configuration/
    vim -c "BundleInstall"
    
```

# For cleanup

```
    ./Vim-Bash-Configuration/remove_symbolic_links.sh ./Vim-Bash-Configuration/

```




