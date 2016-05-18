" Plug 'airblade/vim-gitgutter'
" 
" Plug 'tpope/vim-fugitive'
" 
" Plug 'junegunn/vim-peekaboo'
" Plug 'osyo-manga/vim-over', { 'on': 'OverCommandLine' }
" 
" " File type specific
" Plug 'mustache/vim-mustache-handlebars', { 'for': 'html.handlebars' }
" Plug 'fatih/vim-go', { 'for': 'go' }
" Plug 'tpope/vim-markdown', { 'for': 'markdown' }
" Plug 'tpope/vim-rails'
" Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
" Plug 'jgdavey/vim-blockle', { 'for': 'ruby' }
" Plug 'ngmy/vim-rubocop', { 'for': 'ruby' }
" Plug 'groenewege/vim-less', { 'for': 'less' }
" Plug 'wavded/vim-stylus', { 'for': 'stylus' }
" Plug 'slim-template/vim-slim', { 'for': 'slim' }
" 
" Plug 'yegappan/greplace', { 'on': 'Gsearch' }
" 
" Plug 'tpope/vim-unimpaired'
" Plug 'janko-m/vim-test'
" Plug 'benekastah/neomake', { 'on': 'Neomake' }

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

if has('vim_starting')
  set runtimepath^=~/.vim/bundle/dein.vim
  if !isdirectory(expand('~/.vim/bundle/dein.vim'))
    echo "Installing Dein\n"
    silent execute '!mkdir -p ~/.vim/bundle'
    silent execute '!git clone https://github.com/Shougo/dein.vim ~/.vim/bundle/dein.vim'
  endif
endif

let $VARPATH=expand('$HOME/.cache/nvim')
let $VIMPATH=expand('$HOME/.vim')

function! s:source_file(path) abort
  execute 'source' fnameescape($VIMPATH.'/'.a:path)
endfunction

let s:path = expand($VARPATH . '/dein')
call dein#begin(s:path)
call s:source_file('dein/plugins.vim')
call dein#load_toml('~/.vim/dein/lazy.toml', {'lazy' : 1})
" call s:source_file('dein/pluginslazy.vim')
call dein#end()

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

filetype plugin indent on
