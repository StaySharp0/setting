FROM ubuntu:18.04
MAINTAINER YongJun Kim <StaySharp0@gmail.com>

RUN \
 # change apt refo
  sed -e 's/http:\/\/archive.ubuntu.com\/ubuntu/http:\/\/mirror.kakao.com\/ubuntu/g' /etc/apt/sources.list > /etc/apt/sources.list.tmp && \
  mv /etc/apt/sources.list.tmp /etc/apt/sources.list; \
  apt-get update; \
  apt-get -y install \
   # default build build-essential
    git curl python3 \
   # shell
    tmux vim ; \
   # node.js
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash && \
    . ~/.bashrc && \
    nvm install --lts && \
    nvm alias default lts/* ; \
   # vim default setting
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
    git clone https://github.com/StaySharp0/setting.git ~/.setting && \
    mv ~/.setting/.vimrc ~/ && \
    mv ~/.setting/.tmux.conf ~/ && \
    vim +PluginInstall +qall && \
    rm -rf ~/.setting; \
 # optimization space
  rm -rf /var/lib/apt/lists/*; \
  apt-get clean

EXPOSE 7700-7799
