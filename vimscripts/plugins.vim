set nocompatible
call plug#begin('~/.vim/plugged')

Plug 'rking/ag.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'AndrewRadev/switch.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 't9md/vim-ruby-xmpfilter'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'

Plug 'w0ng/vim-hybrid'
Plug 'nanotech/jellybeans.vim'
Plug 'chriskempson/base16-vim'

Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'kyuhi/vim-emoji-complete'

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

Plug 'janko-m/vim-test'
Plug 'scrooloose/syntastic'
Plug 'ngmy/vim-rubocop'
Plug 'yegappan/greplace'
Plug 'idanarye/vim-merginal'

Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!

call plug#end()

so ~/.dotfiles/vimscripts/fzf.vim