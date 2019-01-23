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
" Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'shime/vim-livedown'

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
set fileencodings=utf8,euc-kr
set encoding=utf-8

set clipboard=unnamedplus

" key mappgng
:let mapleader="," 

map <Leader>n <ESC>:NERDTree<CR>
map <Leader>x <ESC>:q<CR>
map <Leader>s <ESC>:w<CR>
map <Leader>f <ESC>:/
map <Leader>h <ESC>:%s/
map <Leader>ts <ESC>:ConqueTermSplit bash --rcfile ~/.bash_profile<CR><CR>
map <Leader>tv <ESC>:ConqueTermVSplit bash --rcfile ~/.bash_profile<CR><CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <Leader>lp <ESC>:LivedownPreview<CR>
map <Leader>lk <ESC>:LivedownKill<CR>
map <Leader>lt <ESC>:LivedownToggle<CR>

" NerdTree setting
let NERDTreeMapActivateNode='<space>'


" YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = ['', '']
let g:ycm_key_list_previous_completion = ['', '']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_warning_symbol = '>*'
let g:ycm_min_num_of_chars_for_completion = 2		" 기본값은 2입니다. 문자가 1개 입력되면 그 때부터 자동완성을 시작합니다. 쓰지 않을려면 99같은 큰 값을 넣어줍니다.
let g:ycm_auto_trigger = 0							" 기본값은 1입니다. '.'이나 '->'을 받으면 자동으로 목록들을 출력해주죠.
let g:ycm_collect_identifiers_from_tags_files = 1   " tags 파일을 사용합니다. 성능상 이익이 있는걸로 알고 있습니다.
let g:ycm_filetype_whitelist = { '*': 1 }			" 화이트 리스트를 설정합니다.
let g:ycm_filetype_blacklist = { 
	\ 'tagbar' : 1,
    \ 'qf' : 1,
    \ 'notes' : 1, 
	\} " 블랙 리스트를 설정합니다.

nnoremap g :YcmCompleter GoTo
" nnoremap gg :YcmCompleter GoToImprecise
" nnoremap d :YcmCompleter GoToDeclaration
" nnoremap t :YcmCompleter GetType
" nnoremap p :YcmCompleter GetParent 

" Syntax Highlighting
if has("syntax")
    syntax on
endif
