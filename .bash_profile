if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

export TERM=xterm-256color
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin
# https://go.dev/doc/install のとおりに実行している
export PATH=$PATH:/usr/local/go/bin
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

export AWS_DEFAULT_REGION=ap-northeast-1


. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

alias em='emacs -nw'
alias g='git'
alias relogin='exec $SHELL -l'
eval "$(gh completion -s bash)"
. "$HOME/.cargo/env"
export CARGO_NET_GIT_FETCH_WITH_CLI=true
