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

" autoload cscope.out
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  " else add the database pointed to by environment variable
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
endfunction
au BufEnter /* call LoadCscope()

set nocompatible               " be improved, required
filetype off                   " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()            " required
Plugin 'VundleVim/Vundle.vim'  " required

" ===================
" List of plugins here
" ===================

Plugin 'ronakg/quickr-cscope.vim'

" ===================
" end of plugins
" ===================
call vundle#end()               " required
filetype plugin indent on       " required
