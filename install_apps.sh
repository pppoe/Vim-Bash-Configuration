mkdir -pv apps/
## nvim
if [ ! -f /usr/bin/nvim ]; then
    echo "Install neovim"
    wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -O ./apps/nvim.appimage
    chmod u+x apps/nvim.appimage
    sudo ln -vs $PWD/apps/nvim.appimage /usr/bin/nvim
fi

pushd apps/
sudo apt-get -y remove tmux
sudo apt-get -y install wget tar libevent-dev libncurses-dev
VERSION=3.3
wget https://github.com/tmux/tmux/releases/download/${VERSION}/tmux-${VERSION}.tar.gz
tar xf tmux-${VERSION}.tar.gz
rm -f tmux-${VERSION}.tar.gz
cd tmux-${VERSION}
./configure
make
sudo make install
cd -
sudo rm -rf /usr/local/src/tmux-\*
sudo mv tmux-${VERSION} /usr/local/src
sudo killall -9 tmux
tmux kill-server
popd
