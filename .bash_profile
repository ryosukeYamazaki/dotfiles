if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

export TERM=xterm-256color
export GOPATH=~/go
export CXXFLAGS="-I/usr/local/include" LDFLAGS="-L/usr/local/lib"

export EDITOR=emacs
eval "$(direnv hook bash)"

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] \n$ "
export PS2=${PS1}

# fro redis session
export USE_REDIS_SESSION_STORE=1

# 会社用の環境変数とか
if [ -f ~/.bash_profile_for_work ] ; then
. ~/.bash_profile_for_work
fi

# for wsl docker
# https://qiita.com/YukiMiyatake/items/73c7d6c4f2c9739ebe60
export DOCKER_HOST='tcp://0.0.0.0:2375'
export AWS_DEFAULT_REGION=ap-northeast-1


lssh () {
  IP=$(lsec2 $@ | peco | awk -F "\t" '{print $2}')
  if [ $? -eq 0 -a "${IP}" != "" ]
  then
      ssh ${IP}
  fi
}

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

alias em='emacs'
alias g='git'
alias relogin='exec $SHELL -l'
eval "$(gh completion -s bash)"
. "$HOME/.cargo/env"
export CARGO_NET_GIT_FETCH_WITH_CLI=true
