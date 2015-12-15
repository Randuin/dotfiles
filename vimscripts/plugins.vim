set nocompatible
call plug#begin('~/.vim/plugged')

Plug 'rking/ag.vim'
Plug 'tpope/vim-surround'
Plug 'AndrewRadev/switch.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-flagship'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'KabbAmine/yowish.vim'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-vinegar'
Plug 'gregsexton/gitv', { 'on': 'Gitv' }
Plug 'tpope/vim-fugitive'

Plug 'junegunn/vim-peekaboo'
Plug 'osyo-manga/vim-over', { 'on': 'OverCommandLine' }

" File type specific
Plug 'mustache/vim-mustache-handlebars', { 'for': 'html.handlebars' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'jgdavey/vim-blockle', { 'for': 'ruby' }
Plug 'ngmy/vim-rubocop', { 'for': 'ruby' }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'wavded/vim-stylus', { 'for': 'stylus' }
Plug 'mxw/vim-jsx', { 'for': 'jsx' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'slim-template/vim-slim', { 'for': 'slim' }

Plug 'benekastah/neomake'
Plug 'yegappan/greplace', { 'on': 'Gsearch' }

Plug 'tpope/vim-unimpaired'
Plug 'janko-m/vim-test'
Plug 'Shougo/deoplete.nvim'
" Plug 'Shougo/neco-syntax'
Plug 'Shougo/neoinclude.vim'

autocmd User GoyoEnter LimeLight
autocmd User GoyoLeave LimeLight!
