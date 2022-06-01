export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git history-substring-search kubectl kube-ps1 linkerd)
autoload -Uz compinit && compinit

source $ZSH/oh-my-zsh.sh

alias k="kubectl"
alias kurl="kubectl run curl --rm -it --image=appropriate/curl --restart=Never --command /bin/sh"
alias cat="batcat"
alias ls="exa"

PROMPT='$(kube_ps1)'$PROMPT
 
lv() {
  if [ -z "$1" ]; then
    echo $LINKERD2_VERSION
  else
    export LINKERD2_VERSION=$1
    curl https://run.linkerd.io/install -sL | sh
  fi
}

if command -v /workspaces/linkerd2/bin/kind >/dev/null 2>&1 ; then
  /workspaces/linkerd2/bin/kind export kubeconfig --name alex
fi
