#!/bin/sh
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.gitignore ~/.gitignore
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

if [ ! -e ~/.config/gh ]; then
    mkdir -p ~/.config/gh
fi
ln -sf ~/dotfiles/.config/gh/config.yml ~/.config/gh/config.yml
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
