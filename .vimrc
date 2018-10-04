set nocompatible              " be iMproved, required
filetype off                  " required


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
" Syntax
Plugin 'jelera/vim-javascript-syntax'		" JS syntax
Plugin 'octol/vim-cpp-enhanced-highlight'	" C & C++  syntax

Plugin 'nanotech/jellybeans.vim'
Plugin 'wkentaro/conque.vim'
Plugin 'Lokaltog/vim-easymotion'			" Cursor Move
" Plugin 'FuzzyFinder'						" File Finder
Plugin 'majutsushi/tagbar'					" Tag viewer
Plugin 'wesleyche/SrcExpl'					" Vim의 커서가 위치한 변수의 선언 위치나 함수의 정의 부분을 보여주는 Plugin.
Plugin 'Valloric/YouCompleteMe'				" Code 자동완성 Plugin
Plugin 'ludovicchabant/vim-gutentags'		" Ctag 파일을 관리하는 Plugin



call vundle#end()            " required
filetype plugin indent on    " required

color jellybeans
set hlsearch
set softtabstop=4
set tabstop=4
set nu
set autoindent
set shiftwidth=4
set mouse=a

" key mappgng
:let mapleader="," 

map <Leader>n <ESC>:NERDTree<CR>
map <Leader>x <ESC>:q<CR>
map <Leader>s <ESC>:wq<CR>
map <Leader>f <ESC>:/
map <Leader>h <ESC>:%s/
map <Leader>ts <ESC>:ConqueTermSplit bash --rcfile ~/.bash_profile<CR><CR>
map <Leader>tv <ESC>:ConqueTermVSplit bash --rcfile ~/.bash_profile<CR><CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" NerdTree setting
let NERDTreeMapActivateNode='<space>'

" Syntax Highlighting
if has("syntax")
    syntax on
endif
