let mapleader = ";"

map <leader>b :Git blame<CR>

" highlight on spelling errors
set spell
" turn on line numbers
set nu
" syntax highlights
syntax on

" tab is 8 spaces in linux kernel
set tabstop=8
set shiftwidth=8
set softtabstop=8

" don't treat tab as space
set noexpandtab

" not familiar with those options, just trying it
set autoindent
set smartindent

set nocompatible               " be improved, required
filetype off                   " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()            " required
Plugin 'VundleVim/Vundle.vim'  " required

" ===================
" List of plugins here
" ===================

Plugin 'hygoni/quickr-cscope.vim'
Plugin 'preservim/tagbar'
Plugin 'tpope/vim-fugitive'

" ===================
" end of plugins
" ===================
call vundle#end()               " required
filetype plugin indent on       " required

" Tagbar shortcut
nmap <F8> :TagbarToggle<CR>

" Prevent ctags mistake
map <C-]> g]
