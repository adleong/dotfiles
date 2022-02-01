export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

export KUBE_PS1_SYMBOL_DEFAULT='~'

plugins=(git history-substring-search kubectl kube-ps1)
autoload -Uz compinit && compinit

source $ZSH/oh-my-zsh.sh

alias k="kubectl"
alias kurl="kubectl run curl --rm -it --image=appropriate/curl --restart=Never --command /bin/sh"

PROMPT='$(kube_ps1)'$PROMPT
 
lv() {
  if [ -z "$1" ]; then
    echo $LINKERD2_VERSION
  else
    export LINKERD2_VERSION=$1
    curl https://run.linkerd.io/install -sL | sh
  fi
}
