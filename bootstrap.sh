#!/bin/bash

set -eux

DOTFILE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &>/dev/null && pwd )"

sudo apt install -y less vim zsh exa bat
sudo npm install -g fx
sudo npm install -g diff-so-fancy

git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global interactive.diffFilter "diff-so-fancy --patch"
git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

git config --global color.diff.meta       "11"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.func       "146 bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"

git config --global alias.co checkout

mkdir -p $HOME/bin

cp $DOTFILE_DIR/.zshenv $HOME/.zshenv
curl -sL https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | zsh
cp $DOTFILE_DIR/.zshrc $HOME/.zshrc

bin/kind export kubeconfig --name alex
