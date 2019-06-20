if &compatible
  set nocompatible               " Be iMproved
endif

call plug#begin('~/.nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'

" Color
Plug 'yous/vim-open-color'
Plug 'chase/focuspoint-vim'

" Plug 'tweekmonster/startuptime.vim'
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-operator-surround'
nmap <silent>sa <Plug>(operator-surround-append)
nmap <silent>sd <Plug>(operator-surround-delete)
nmap <silent>sr <Plug>(operator-surround-replace)
Plug 'tpope/vim-unimpaired'

" Code quality
" Plug 'w0rp/ale'
" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \   'javascript': ['prettier'],
" \   'css': ['prettier', 'stylelint'],
" \   'scss': ['prettier', 'stylelint'],
" \   'sass': ['prettier', 'stylelint'],
" \   'ruby': ['standardrb'],
" \}
" let g:ale_fix_on_save = 1
" let g:ale_linters = {
" \   'ruby': ['standardrb'],
" \}
" Plug 'sbdchd/neoformat'

Plug 'janko-m/vim-test'
let g:neoterm_shell = "fish"
Plug 'kassio/neoterm'
Plug 'mustache/vim-mustache-handlebars'

" Plug 'lambdalisue/gina.vim'
" nnoremap <silent> [Space]gs  :<C-u>Gina status<CR>
" nnoremap <silent> [Space]gc  :<C-u>Gina commit<CR>
" nnoremap <silent> [Space]ga  :<C-u>Gina commit --amend<CR>
" nnoremap <silent> [Space]gd  :<C-u>Gina diff<CR>
" nnoremap <silent> [Space]gb  :<C-u>Gina browse<CR>
" nnoremap <silent> [Space]gl  :<C-u>Gina blame<CR>

" autocmd FileType gina-status
"       \ nmap <buffer> cc    <Plug>(gina-commit-open) |
"       \ nmap <buffer> cA    <Plug>(gina-commit-open-amend)
Plug 'airblade/vim-gitgutter'

" Ruby
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby'] }
" Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
" Plug 'osyo-manga/vim-monster', { 'for': 'ruby' }

" JS
" Plug 'pangloss/vim-javascript'
Plug 'jason0x43/vim-js-indent'
"
"Plug 'HerringtonDarkholme/yats.vim'
Plug 'leafgarland/typescript-vim'
" Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'Quramy/vim-js-pretty-template'
Plug 'jason0x43/vim-js-indent'

Plug 'peitalin/vim-jsx-typescript'
" Plug 'neoclide/vim-jsx-improve', { 'for': [ 'javascript', 'js', 'jsx', 'typescript', 'typescrip.tsx' ]}
Plug 'jparise/vim-graphql'

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

hi tsxTagName guifg=#E06C75
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575
hi tsxTypeBraces guifg=#999999
hi tsxTypes guifg=#666666
hi tsxAttrib guifg=#F8BD7F cterm=italic
hi ReactState guifg=#C176A7
hi ReactProps guifg=#D19A66
hi Events ctermfg=204 guifg=#56B6C2
hi ReduxKeywords ctermfg=204 guifg=#C678DD
hi WebBrowser ctermfg=204 guifg=#56B6C2
hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66

Plug 'styled-components/vim-styled-components', { 'for': ['javascript', 'js', 'jsx', 'ts', 'typescript'], 'branch': 'main'}


" Plug 'jparise/vim-graphql'
" Plug 'sheerun/vim-polyglot'

autocmd BufNewFile,BufRead *.md set filetype=markdown

augroup javascript_folding
    au!
    au FileType javascript,javascript.jsx setlocal foldmethod=syntax
augroup END

" Misc
" Plug 'gabrielelana/vim-markdown'
" Plug 'rcmdnk/vim-markdown', { 'for': 'markdown' }
Plug 'fatih/vim-go', { 'for': 'go' }


Plug 'neoclide/coc.nvim', {'tag': '*', 'do': 'yarn install --frozen-lockfile'}
inoremap <silent><expr> <c-s-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 Format :call CocAction('format')
autocmd BufWritePre *.jsx Format
autocmd BufWritePre *.tsx Format
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


" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'wokalski/autocomplete-flow'

" Plug 'Shougo/deoplete-rct', { 'for': 'ruby' }
" Plug 'fishbullet/deoplete-ruby', { 'for': 'ruby' }

Plug 'dyng/ctrlsf.vim', { 'on': ['CtrlSF', 'CtrlSFToggle'] }
" Plug 'Shougo/neoinclude.vim'
Plug 'dag/vim-fish'

call plug#end()

" augroup fmt
"   autocmd!
"   " autocmd FileType javascript,javascript.jsx set formatprg=prettier\ --stdin\ --parser\ flow\ --single-quote
"   autocmd BufWritePre * Neoformat
" augroup END

" let g:neoformat_enabled_ruby = ['rufo', 'ruby-beautify']
" augroup go
"   autocmd!
"   autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
"   autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
"   autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
" augroup END
