#!/bin/sh
# 依存関係のインストール
sudo apt update
sudo apt install -y tmux
sudo apt install -y direnv
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.0
. $HOME/.asdf/asdf.sh # installするために一時的にasdfを読み込む

# install textlint
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
exec $SHELL -l
asdf nodejs update-nodebuild
asdf install nodejs latest
asdf global nodejs latest
npm install -g textlint
npm install -g textlint-plugin-org
npm install -g textlint-rule-preset-ja-technical-writing
npm install -g textlint-rule-preset-ja-spacing
npm install -g textlint-rule-write-good

# install git delta
curl https://sh.rustup.rs -sSf | sh
sudo apt install -y gcc
cargo install git-delta


ln -sf $(pwd)/.tmux.conf ~/.tmux.conf
ln -sf $(pwd)/.gitignore ~/.gitignore
ln -sf $(pwd)/.gitconfig ~/.gitconfig
sudo ln -sf $(pwd)/textlint.sh /usr/local/bin/textlint.sh
if [ ! -e ~/.config/textlint ]; then
    mkdir -p ~/.config/textlint
fi
ln -sf $(pwd)/textlint/textlintrc_ja.json ~/.config/textlint/textlintrc_ja.json
ln -sf $(pwd)/textlint/textlintrc_en.json ~/.config/textlint/textlintrc_en.json

if [ ! -e ~/.config/gh ]; then
    mkdir -p ~/.config/gh
fi
ln -sf $(pwd)/.config/gh/config.yml ~/.config/gh/config.yml
ln -sf $(pwd)/.bash_profile ~/.bash_profile
