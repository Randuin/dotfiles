set nocompatible
call plug#begin('~/.vim/plugged')

Plug 'rking/ag.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'AndrewRadev/switch.vim'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'

Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'kyuhi/vim-emoji-complete'
Plug 'mhumeSF/one-dark.vim'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-vinegar'
Plug 'majutsushi/tagbar'
Plug 'junegunn/rainbow_parentheses.vim'

Plug 'junegunn/vim-peekaboo'
Plug 'osyo-manga/vim-over'

" File type specific
Plug 'mustache/vim-mustache-handlebars'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'jgdavey/vim-blockle', { 'for': 'ruby' }
Plug 'ecomba/vim-ruby-refactoring', { 'for': 'ruby' }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'wavded/vim-stylus', { 'for': 'stylus' }
Plug 'mxw/vim-jsx', { 'for': 'jsx' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'slim-template/vim-slim', { 'for': 'slim' }

Plug 'scrooloose/syntastic'
Plug 'ngmy/vim-rubocop'
Plug 'yegappan/greplace'
Plug 'lambdalisue/vim-gita'

Plug 'einars/js-beautify'
Plug 'maksimr/vim-jsbeautify'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-bundler'
Plug 'janko-m/vim-test'

autocmd User GoyoEnter LimeLight
autocmd User GoyoLeave LimeLight!
