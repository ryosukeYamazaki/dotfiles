if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

eval "$(rbenv init -)"
eval "$(ndenv init -)"
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
eval "$(direnv hook bash)"
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export GOPATH=$HOME/go
export GOROOT=`go env GOROOT`
export PATH="$GOPATH/bin:$PATH"

export PS1='\W \u \d \t $ '
export PS2=${PS1}



export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0_101`

export PATH

# fro redis session
export USE_REDIS_SESSION_STORE=1

# The next line updates PATH for the Google Cloud SDK.
source '/Users/yamazaki-ryosuke/Library/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/Users/yamazaki-ryosuke/Library/google-cloud-sdk/completion.bash.inc'

# 会社用の環境変数とか
if [ -f ~/.bash_profile_for_work ] ; then
. ~/.bash_profile_for_work
fi
