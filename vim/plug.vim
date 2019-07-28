if &compatible
  set nocompatible               " Be iMproved
endif

call plug#begin('~/.nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug '/usr/local/opt/fzf'
" Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'Shougo/denite.nvim'

" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
let s:denite_options = {'default' : {
\ 'auto_resize': 1,
\ 'prompt': 'λ:',
\ 'direction': 'rightbelow',
\ 'winminheight': '10',
\ 'highlight_mode_insert': 'Visual',
\ 'highlight_mode_normal': 'Visual',
\ 'prompt_highlight': 'Function',
\ 'highlight_matched_char': 'Function',
\ 'highlight_matched_range': 'Normal'
\ }}

" Color
Plug 'yous/vim-open-color'
Plug 'chase/focuspoint-vim'
Plug 'larsbs/vimterial_dark'

" Plug 'tweekmonster/startuptime.vim'
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-operator-surround'
nmap <silent>sa <Plug>(operator-surround-append)
nmap <silent>sd <Plug>(operator-surround-delete)
nmap <silent>sr <Plug>(operator-surround-replace)
Plug 'tpope/vim-unimpaired'

Plug 'janko-m/vim-test'
let g:neoterm_shell = "fish"
Plug 'kassio/neoterm'
Plug 'mustache/vim-mustache-handlebars'

Plug 'airblade/vim-gitgutter'

" Ruby
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby'] }

" JS
Plug 'jason0x43/vim-js-indent'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'jparise/vim-graphql'

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

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


Plug 'neoclide/coc.nvim', {'branch': 'release'}
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



Plug 'dyng/ctrlsf.vim', { 'on': ['CtrlSF', 'CtrlSFToggle'] }
Plug 'dag/vim-fish'

call plug#end()


nmap ; :Denite buffer -split=floating -winrow=1<CR>
nmap <leader>t :Denite file/rec -split=floating -winrow=1<CR>
nnoremap <leader>g :<C-u>Denite grep:. -no-empty<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:.<CR>

call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

" Use ripgrep in place of "grep"
call denite#custom#var('grep', 'command', ['rg'])

" Custom options for ripgrep
"   --vimgrep:  Show results with every match on it's own line
"   --hidden:   Search hidden directories and files
"   --heading:  Show the file name above clusters of matches from each file
"   --S:        Search case insensitively if the pattern is all lowercase
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

" Recommended defaults for ripgrep via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction
