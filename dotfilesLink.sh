#!/bin/sh
# 依存関係のインストール
sudo apt update
sudo apt install direnv
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.
curl https://sh.rustup.rs -sSf | sh
sudo apt install gcc
cargo install git-delta

ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.gitignore ~/.gitignore
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

if [ ! -e ~/.config/gh ]; then
    mkdir -p ~/.config/gh
fi
ln -sf ~/dotfiles/.config/gh/config.yml ~/.config/gh/config.yml
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
