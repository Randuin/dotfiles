if &compatible
  set nocompatible               " Be iMproved
endif

call plug#begin('~/.nvim/plugged')

" Plug 'kyazdani42/nvim-web-devicons' " for file icons
" Plug 'kyazdani42/nvim-tree.lua'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'liuchengxu/vim-clap'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'

" Color
Plug 'yous/vim-open-color'
" Plug 'chase/focuspoint-vim'
" Plug 'larsbs/vimterial_dark'
Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'chriskempson/base16-vim'
Plug 'yous/vim-open-color'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Plug 'tweekmonster/startuptime.vim'
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-operator-surround'
nmap <silent>sa <Plug>(operator-surround-append)
nmap <silent>sd <Plug>(operator-surround-delete)
nmap <silent>sr <Plug>(operator-surround-replace)
Plug 'tpope/vim-unimpaired'

Plug 'janko-m/vim-test'
let g:neoterm_shell = "zsh"
Plug 'kassio/neoterm'
Plug 'mustache/vim-mustache-handlebars'

" Ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby'] }

" JS
Plug 'jason0x43/vim-js-indent', {'for': ['javascript','typescript','javascript.jsx','typescript.tsx']}
Plug 'jparise/vim-graphql', {'for': ['javascript','typescript','javascript.jsx','typescript.tsx','graphql']}
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'posva/vim-vue'
Plug 'evanleck/vim-svelte'
Plug 'tpope/vim-liquid'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
"Plug 'HerringtonDarkholme/yats.vim'
Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}


let g:vue_pre_processors = ['scss']

autocmd BufNewFile,BufRead *.tsx,*.jsx,*.ts set filetype=typescript.tsx

Plug 'styled-components/vim-styled-components', { 'for': ['javascript', 'js', 'jsx', 'ts', 'typescript'], 'branch': 'main'}

autocmd BufNewFile,BufRead *.md set filetype=markdown

augroup javascript_folding
    au!
    au FileType javascript,javascript.jsx setlocal foldmethod=syntax
augroup END

" Misc
" Plug 'gabrielelana/vim-markdown'
" Plug 'rcmdnk/vim-markdown', { 'for': 'markdown' }
Plug 'fatih/vim-go', { 'for': 'go' }
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'


Plug 'neoclide/coc.nvim', {'branch': 'release'}
" function! NearestMethodOrFunction() abort
"   return get(b:, 'vista_nearest_method_or_function', '')
" endfunction
" 
" set statusline+=%{NearestMethodOrFunction()}
Plug 'liuchengxu/vista.vim'

inoremap <silent><expr> <c-s-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" command! -nargs=0 OR   :call     CocAction('runCommand', 'tsserver.organizeImports')
" autocmd BufWritePre *.jsx Format
" autocmd BufWritePre *.tsx Format
nmap <leader>qf  <Plug>(coc-fix-current)
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" autocmd CursorHold * silent call CocActionAsync('highlight')
" autocmd CursorHoldI,CursorMovedI * silent! call CocActionAsync('showSignatureHelp')
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


call plug#end()
