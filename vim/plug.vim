if &compatible
  set nocompatible               " Be iMproved
endif

silent execute '!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

call plug#begin('~/.nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'jacoborus/tender'

Plug 'neomake/neomake'
au BufWritePost * Neomake
let g:neomake_javascript_enabled_checkers = ['jshint', 'jscs', 'eslint']
let g:neomake_javascript_jscs_options = '--esnext'

Plug 'janko-m/vim-test'
Plug 'kassio/neoterm'
Plug 'tpope/vim-rails'

call plug#end()
