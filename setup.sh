#!/bin/bash
# ghのPPAを登録する
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

# 依存関係のインストール
sudo apt update
sudo apt install -y tmux
sudo apt install -y direnv
sudo apt install pass
sudo apt install xsel
sudo apt install emacs-mozc emacs-mozc-bin
sudo apt install -y emacs
sudo apt install -y gh
sudo apt install -y netcat-openbsd wl-copy
if [ ! -e ~/.asdf ]; then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.0
fi

source $HOME/.asdf/asdf.sh # installするために一時的にasdfを読み込む

# install textlint
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf nodejs update-nodebuild
asdf install nodejs latest
asdf global nodejs latest
npm install -g textlint
npm install -g textlint-plugin-org
npm install -g textlint-rule-preset-ja-technical-writing
npm install -g textlint-rule-preset-ja-spacing
npm install -g textlint-rule-write-good

# install git delta
curl https://sh.rustup.rs -sSf | sh -s -- -y
source "$HOME/.cargo/env"
sudo apt install -y gcc
cargo install git-delta

ln -sf $(pwd)/.emacs.d ~/.emacs.d
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
if [ ! -e ~/.config/systemd/user ]; then
    mkdir -p ~/.config/systemd/user
fi
ln -sf $(pwd)/.config/systemd/user/nc-clipboard-listener.service ~/.config/systemd/user/nc-clipboard-listener.service
systemctl --user daemon-reload
systemctl --user enable --now nc-clipboard-listener.service

ln -sf $(pwd)/.bash_profile ~/.bash_profile
if [ ! -e ~/.gnupg ]; then
    mkdir -p ~/.gnupg
    ln -sf $(pwd)/gpg-agent.conf ~/.gnupg/gpg-agent.conf
fi

# ----------------------------------------------------------------------
# ★ 追加・修正：リモートサーバーのファイアウォール(ufw)を安全に設定
# ----------------------------------------------------------------------
echo "Configuring firewall (ufw) for secure port forwarding..."

# 念のため、過去に設定した可能性のある安全でないルールを削除
# --non-interactive をつけることで、ルールが存在しない場合にエラーで止まるのを防ぐ
sudo ufw --non-interactive delete allow 8888/tcp

# localhost(127.0.0.1)からのポート8888へのTCP通信のみを許可する安全なルールを追加
# ufw status numbered でルールを確認し、同じルールがなければ追加する
if ! sudo ufw status | grep -q "8888/tcp.*ALLOW IN.*127.0.0.1"; then
    echo "Adding secure firewall rule for port 8888..."
    sudo ufw allow from 127.0.0.1 to any port 8888 proto tcp
else
    echo "Secure firewall rule for port 8888 already exists."
fi

echo "Firewall configuration complete."
