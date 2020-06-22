#!/bin/bash

sshPath="$HOME/.ssh/"

echo -e "rsa key name(default: id_rsa): \c"
read sshFileName
if [ ${#sshFileName} -eq 0 ]; then
    sshFileName="id_rsa"
fi

if [ ! -f "~/.ssh/$sshFileName" ]; then
    sshPath+=$sshFileName
    ssh-keygen -q -t rsa -N '' -f $sshPath >/dev/null <<< y >/dev/null;
fi

sudo apt -qq -y update && sudo apt -qq -y upgrade;
sudo apt -qq -y install git nodejs npm;

git config --global user.email "staysharp0@gmail.com"
git config --global user.name "YongJun Kim"

echo "";
cat $sshPath.pub;
echo "";
eval $(ssh-agent -s) && ssh-add $sshPath;

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim;
mv ~/.setting/.vimrc ~/ && \
mv ~/.setting/.tmux.conf ~/ && \
vim +PluginInstall +qall
