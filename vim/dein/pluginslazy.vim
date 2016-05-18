call dein#add('scrooloose/nerdtree', { 'on_cmd': 'NERDTreeToggle' })

" [[plugins]]
" repo = 'Shougo/context_filetype.vim'
" 
" [[plugins]]
" repo = 'Shougo/neco-vim'
" on_ft = 'vim'
" 
" [[plugins]]
" repo = 'Shougo/neoinclude.vim'
" on_if = 1
" 
" [[plugins]]
" repo = 'Shougo/neco-syntax'
" on_source = ['neocomplete.vim', 'deoplete.nvim']
" 
" [[plugins]]
" repo = 'kana/vim-niceblock'
" on_map = [['x', '<Plug>']]
" hook_add = '''
"   xmap I  <Plug>(niceblock-I)
"   xmap A  <Plug>(niceblock-A)
" '''
" 
" [[plugins]]
" repo = 'vim-jp/vital.vim'
" 
" [[plugins]]
" repo = 'thinca/vim-fontzoom'
" on_map = [['n', '<Plug>']]
" hook_add = '''
"   nmap + <Plug>(fontzoom-larger)
"   nmap _ <Plug>(fontzoom-smaller)
" '''
" 
" [[plugins]]
" repo = 'thinca/vim-qfreplace'
" on_ft = 'quickfix'
" hook_source = '''
"   autocmd MyAutoCmd FileType qf nnoremap <buffer> r :<C-u>Qfreplace<CR>
" '''
" 
" [[plugins]]
" repo = 'ujihisa/neco-look'
" on_source = ['deoplete.nvim']
" 
" [[plugins]]
" repo = 'rhysd/accelerated-jk'
" on_map = [['n', '<Plug>']]
" hook_add = '''
"   nmap <silent>j <Plug>(accelerated_jk_gj)
"   nmap <silent>k <Plug>(accelerated_jk_gk)
" '''
" 
" [[plugins]]
" repo = 'fatih/vim-go'
" on_ft = 'go'
" 
" [[plugins]]
" repo = 'nsf/gocode'
" rtp = 'vim'
" on_ft = 'go'
" 
" [[plugins]]
" repo = 'todesking/ruby_hl_lvar.vim'
" on_ft = 'ruby'
" 
" [[plugins]]
" repo = 'kana/vim-operator-replace'
" depends = 'vim-operator-user'
" on_map = [['nx', '<Plug>']]
" hook_add = 'xmap p <Plug>(operator-replace)'
" 
" [[plugins]]
" repo = 'rhysd/vim-operator-surround'
" depends = 'vim-operator-user'
" on_map = [['n', '<Plug>']]
" hook_add = '''
"   nmap <silent>sa <Plug>(operator-surround-append)a
"   nmap <silent>sd <Plug>(operator-surround-delete)a
"   nmap <silent>sr <Plug>(operator-surround-replace)a
"   nmap <silent>sc <Plug>(operator-surround-replace)a
" '''
" 
" [[plugins]]
" repo = 'osyo-manga/vim-monster'
" on_ft = 'ruby'
" 
" [[plugins]]
" repo = 'lambdalisue/vim-gita'
" hook_add = '''
"   nnoremap <silent> [Space]gs  :<C-u>Gita status<CR>
"   nnoremap <silent> [Space]gc  :<C-u>Gita commit<CR>
"   nnoremap <silent> [Space]ga  :<C-u>Gita commit --amend<CR>
"   nnoremap <silent> [Space]gd  :<C-u>Gita diff<CR>
"   nnoremap <silent> [Space]gb  :<C-u>Gita browse<CR>
"   nnoremap <silent> [Space]gl  :<C-u>Gita blame<CR>
" 
"   autocmd FileType gita-status
"   \ nmap <buffer> cc    <Plug>(gita-commit-open) |
"   \ nmap <buffer> cA    <Plug>(gita-commit-open-amend)
" '''
" 
" [[plugins]]
" repo = 'lambdalisue/vim-gista'
" on_map = [['n', '<Plug>']]
" hook_add = '''
"   let g:gista#github_user = 'randuin'
"   let g:gista#directory = expand('$CACHE/gista')
" '''
" 
" [[plugins]]
" repo = 'racer-rust/vim-racer'
" on_ft = 'rust'
" hook_source = '''
"   let $RUST_SRC_PATH = expand('~/src/rust/src')
"   let g:racer_experimental_completer = 1
" '''
" 
" [[plugins]]
" repo = 'rust-lang/rust.vim'
" on_ft = 'rust'
" 
" [[plugins]]
" repo = 'rhysd/rust-doc.vim'
" on_ft = 'rust'
" 
" [[plugins]]
" repo = 'lambdalisue/vim-protocol'
" on_path = '^https\?://'
" 
" [[plugins]]
" repo = 'rking/ag.vim'
" on_cmd = 'Ag'
