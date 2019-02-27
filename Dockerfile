FROM ubuntu:18.04
MAINTAINER YongJun Kim <StaySharp0@gmail.com>

RUN \
 # change apt refo
  sed -i -e 's/http:\/\/archive.ubuntu.com\/ubuntu/http:\/\/mirror.kakao.com\/ubuntu/g' /etc/apt/sources.list; \
  apt-get update; \
  apt-get -y install \
	locales fonts-powerline \
    git curl python3 \
    zsh tmux vim; \
 # generate ko_KR.UTF-8
  locale-gen ko_KR.UTF-8; \
 # change default shell(zsh)
  chsh -s `which zsh` && \
  curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh && \
  sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' ~/.zshrc 

SHELL ["/usr/bin/zsh", "-c"]

RUN \
 # nvm
  git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm && \ 
  sed -i 's/plugins=(/&zsh-nvm /' ~/.zshrc && \
  source ~/.zshrc; \
  nvm install --lts && \
  nvm use --lts && nvm alias default node; \
 # vim
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
  git clone https://github.com/StaySharp0/setting.git ~/.setting && \
  mv ~/.setting/.vimrc ~/ && \
  mv ~/.setting/.tmux.conf ~/ && \
  vim +PluginInstall +qall && \
  npm install -g --no-optional livedown && \
  rm -rf ~/.setting; \
 # optimization space
  rm -rf /var/lib/apt/lists/*; \
  apt-get clean

CMD [ "zsh" ]
EXPOSE 7700-7799
ENV LC_ALL ko_KR.UTF-8 
