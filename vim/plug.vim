if &compatible
  set nocompatible               " Be iMproved
endif

call plug#begin('~/.nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-vinegar'

" Color
Plug 'MaxSt/FlatColor'

Plug 'tweekmonster/startuptime.vim'
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-operator-surround'
nmap <silent>sa <Plug>(operator-surround-append)
nmap <silent>sd <Plug>(operator-surround-delete)
nmap <silent>sr <Plug>(operator-surround-replace)
Plug 'tpope/vim-unimpaired'

" Code quality
Plug 'w0rp/ale'
Plug 'sbdchd/neoformat'

Plug 'janko-m/vim-test'
let g:neoterm_shell = "zsh"
Plug 'kassio/neoterm'

Plug 'lambdalisue/gina.vim'
nnoremap <silent> [Space]gs  :<C-u>Gina status<CR>
nnoremap <silent> [Space]gc  :<C-u>Gina commit<CR>
nnoremap <silent> [Space]ga  :<C-u>Gina commit --amend<CR>
nnoremap <silent> [Space]gd  :<C-u>Gina diff<CR>
nnoremap <silent> [Space]gb  :<C-u>Gina browse<CR>
nnoremap <silent> [Space]gl  :<C-u>Gina blame<CR>

autocmd FileType gina-status
      \ nmap <buffer> cc    <Plug>(gina-commit-open) |
      \ nmap <buffer> cA    <Plug>(gina-commit-open-amend)
Plug 'airblade/vim-gitgutter'

" Ruby
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby'] }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'osyo-manga/vim-monster', { 'for': 'ruby' }

" JS
Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx']}
Plug 'othree/jsdoc-syntax.vim', { 'for': ['javascript', 'typescript'] }
Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
let g:used_javascript_libs = 'underscore,react'
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
let g:jsx_ext_required = 0
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
let g:javascript_plugin_flow = 1
Plug 'fleischie/vim-styled-components', { 'for': ['javascript', 'javascript.jsx'] }

augroup javascript_folding
    au!
    au FileType javascript,javascript.jsx setlocal foldmethod=syntax
augroup END

" Misc
Plug 'rcmdnk/vim-markdown', { 'for': 'markdown' }
Plug 'fatih/vim-go', { 'for': 'go' }

" Plug 'jparise/vim-graphql'

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'wokalski/autocomplete-flow'

" Plug 'Shougo/deoplete-rct', { 'for': 'ruby' }
" Plug 'fishbullet/deoplete-ruby', { 'for': 'ruby' }

Plug 'dyng/ctrlsf.vim', { 'on': ['CtrlSF', 'CtrlSFToggle'] }
Plug 'Shougo/neoinclude.vim'

call plug#end()

" augroup fmt
"   autocmd!
"   " autocmd FileType javascript,javascript.jsx set formatprg=prettier\ --stdin\ --parser\ flow\ --single-quote
"   autocmd BufWritePre * Neoformat
" augroup END

let g:neoformat_enabled_ruby = ['rubocop', 'ruby-beautify']
augroup go
  autocmd!
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
augroup END
