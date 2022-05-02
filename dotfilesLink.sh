#!/bin/sh
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.gitignore ~/.gitignore
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

if [ ! -e ~/dotfiles/.config/gh ]; then
    mkdir -p ~/dotfiles/.config/gh
fi
ln -sf ~/dotfiles/.config/gh/config.yml ~/.config/gh/config.yml
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
