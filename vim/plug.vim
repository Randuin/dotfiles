if &compatible
  set nocompatible               " Be iMproved
endif

silent execute '!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

call plug#begin('~/.nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'jacoborus/tender'
Plug 'rking/ag.vim', { 'on': 'Ag' }

" Code quality
Plug 'neomake/neomake'
au BufWritePost * Neomake
let g:neomake_javascript_enabled_checkers = ['eslint']
Plug 'ngmy/vim-rubocop', { 'on': 'Rubocop' }

Plug 'janko-m/vim-test'
Plug 'kassio/neoterm'
Plug 'vim-jp/autofmt'

Plug 'Shougo/deoplete.nvim'
let g:deoplete#enable_at_startup = 1
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neco-syntax'
Plug 'ujihisa/neco-look'
Plug 'lambdalisue/vim-gita'
nnoremap <silent> [Space]gs  :<C-u>Gita status<CR>
nnoremap <silent> [Space]gc  :<C-u>Gita commit<CR>
nnoremap <silent> [Space]ga  :<C-u>Gita commit --amend<CR>
nnoremap <silent> [Space]gd  :<C-u>Gita diff<CR>
nnoremap <silent> [Space]gb  :<C-u>Gita browse<CR>
nnoremap <silent> [Space]gl  :<C-u>Gita blame<CR>

autocmd FileType gita-status
      \ nmap <buffer> cc    <Plug>(gita-commit-open) |
      \ nmap <buffer> cA    <Plug>(gita-commit-open-amend)

" Ruby
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'osyo-manga/vim-monster', { 'for': 'ruby' }

" JS
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'jiangmiao/simple-javascript-indenter', { 'for': 'javascript' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }

" Misc
Plug 'rcmdnk/vim-markdown', { 'for': 'markdown' }
Plug 'slim-template/vim-slim', { 'for': 'slim' }

call plug#end()
