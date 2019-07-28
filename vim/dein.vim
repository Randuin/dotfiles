" Plug 'airblade/vim-gitgutter'
" 
" Plug 'tpope/vim-fugitive'
" 
" Plug 'junegunn/vim-peekaboo'
" Plug 'osyo-manga/vim-over', { 'on': 'OverCommandLine' }
" 
" " File type specific
" Plug 'mustache/vim-mustache-handlebars', { 'for': 'html.handlebars' }
" Plug 'fatih/vim-go', { 'for': 'go' }
" Plug 'tpope/vim-markdown', { 'for': 'markdown' }
" Plug 'tpope/vim-rails'
" Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
" Plug 'jgdavey/vim-blockle', { 'for': 'ruby' }
" Plug 'ngmy/vim-rubocop', { 'for': 'ruby' }
" Plug 'groenewege/vim-less', { 'for': 'less' }
" Plug 'wavded/vim-stylus', { 'for': 'stylus' }
" Plug 'slim-template/vim-slim', { 'for': 'slim' }
" 
" Plug 'yegappan/greplace', { 'on': 'Gsearch' }
" 
" Plug 'tpope/vim-unimpaired'
" Plug 'janko-m/vim-test'
" Plug 'benekastah/neomake', { 'on': 'Neomake' }

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

if has('vim_starting')
  set runtimepath^=~/.vim/bundle/dein.vim
  if !isdirectory(expand('~/.vim/bundle/dein.vim'))
    echo "Installing Dein\n"
    silent execute '!mkdir -p ~/.vim/bundle'
    silent execute '!git clone https://github.com/Shougo/dein.vim ~/.vim/bundle/dein.vim'
  endif
endif

let $VARPATH=expand('$HOME/.cache/nvim')
let $VIMPATH=expand('$HOME/.vim')

function! s:source_file(path) abort
  execute 'source' fnameescape($VIMPATH.'/'.a:path)
endfunction

let s:path = expand($VARPATH . '/dein')

let g:dein#auto_recache = 1
let g:dein#install_progress_type = 'title'
let g:dein#enable_notification = 1

call dein#begin(s:path)
call dein#load_toml('~/.vim/dein/default.toml', {'lazy' : 0})
call dein#load_toml('~/.vim/dein/lazy.toml', {'lazy' : 1})
call dein#end()

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

filetype plugin indent on

" let s:denite_options = {'default' : {
" \ 'auto_resize': 1,
" \ 'prompt': 'λ:',
" \ 'direction': 'rightbelow',
" \ 'winminheight': '10',
" \ 'highlight_mode_insert': 'Visual',
" \ 'highlight_mode_normal': 'Visual',
" \ 'prompt_highlight': 'Function',
" \ 'highlight_matched_char': 'Function',
" \ 'highlight_matched_range': 'Normal'
" \ }}

nmap ; :Denite buffer -split=floating -winrow=1<CR>
nmap <leader>t :Denite file/rec -split=floating -winrow=1<CR>
" nmap <leader>g :<C-u>Denite grep:. -no-empty<CR>
" nmap <leader>j :<C-u>DeniteCursorWord grep:.<CR>

" call denite#custom#var('file/rec', 'command',
"       \ ['ag', '--follow', '--nogroup', '-S', '-g', '--nocolor', '-u', ''])
" call denite#custom#source(
"       \ 'file_mru', 'matchers', ['matcher/fuzzy', 'matcher/project_files'])
" call denite#custom#source(
"       \ 'file/rec', 'matchers', ['matcher/cpsm'])
" call denite#custom#source(
" 	\ 'file/rec', 'sorters', ['sorter/sublime'])
" call denite#custom#var('grep', 'command', ['ag'])
" call denite#custom#var('grep', 'default_opts',
"     \ ['-i', '--vimgrep'])
" call denite#custom#var('grep', 'recursive_opts', [])
" call denite#custom#var('grep', 'pattern_opt', [])
" call denite#custom#var('grep', 'separator', ['--'])
" call denite#custom#var('grep', 'final_opts', [])
" 
" " Remove date from buffer list
" call denite#custom#var('buffer', 'date_format', '')

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
