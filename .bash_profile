if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

export TERM=xterm-256color
export PATH=$HOME/.ndenv/bin:/usr/local/redis-2.6/bin:$PATH
export PATH=~/bin:$PATH
export CXXFLAGS="-I/usr/local/include" LDFLAGS="-L/usr/local/lib"

export PATH="$HOME/.cask/bin:$PATH"

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
export GOROOT=`go env GOROOT`
export GOPATH=$HOME/freee-work/go
export PATH=$PATH:$GOPATH/bin

PY2_VERSION="2.7.14"
PY3_VERSION="3.6.3"

pyenv global $PY3_VERSION $PY2_VERSION

eval "$(direnv hook bash)"

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
export PS2=${PS1}

export PATH

# fro redis session
export USE_REDIS_SESSION_STORE=1

# for plantuml
export GRAPHVIZ_DOT=/usr/bin/dot

# 会社用の環境変数とか
if [ -f ~/.bash_profile_for_work ] ; then
. ~/.bash_profile_for_work
fi
export PATH=$HOME/.anyenv/bin:$PATH && eval "$(anyenv init -)"
export PATH=~/bin:$PATH

lssh () {
  IP=$(lsec2 $@ | peco | awk -F "\t" '{print $2}')
  if [ $? -eq 0 -a "${IP}" != "" ]
  then
      ssh ${IP}
  fi
}
