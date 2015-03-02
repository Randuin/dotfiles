" vim:set ts=2 sts=2 sw=2 expandtab:
set nocompatible
filetype off
set shell=zsh
au BufRead,BufNewFile *.mobile.erb set ft=eruby.html

call plug#begin('~/.vim/plugged')

Plug 'rking/ag.vim'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'AndrewRadev/switch.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 't9md/vim-ruby-xmpfilter'
Plug 'tpope/vim-vinegar'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'w0ng/vim-hybrid'
Plug 'zeekay/vim-js2coffee'
Plug 'Shougo/neocomplete.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'kien/rainbow_parentheses.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'majutsushi/tagbar'

Plug 'junegunn/vim-peekaboo'

" File type specific
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'jgdavey/vim-blockle', { 'for': 'ruby' }
Plug 'ecomba/vim-ruby-refactoring', { 'for': 'ruby' }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'rainerborene/vim-reek'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'wavded/vim-stylus', { 'for': 'stylus' }

Plug 'janko-m/vim-test'
Plug 'scrooloose/syntastic'
Plug 'ngmy/vim-rubocop'

let g:reek_on_loading = 0

call plug#end()

" Required:
filetype plugin indent on

set background=dark
" " let base16colorspace=256
colorscheme hybrid

set fileencoding=utf-8
filetype plugin indent on
set hidden
set scrolloff=3
set ignorecase smartcase
set winwidth=80
set t_ti= t_te=
set lazyredraw
set nojoinspaces

" Turn off the bell
set vb
set t_vb=

syntax on
set backspace=indent,eol,start
set number " Show line numbers

" Turn folding off for real, hopefully
set foldmethod=manual
set nofoldenable

" Modelines (comments that set vim options on a per-file basis)
set modeline
set modelines=3

" Tabs ************************************************************************
set autoindent
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab

" Searching *******************************************************************
set incsearch  " incremental search, search as you type
set hlsearch
highlight Search ctermbg=NONE ctermfg=NONE cterm=underline gui=underline guifg=NONE guibg=NONE
set wrapscan

" Status Line *****************************************************************
set showcmd
set ruler " Show ruler

" show trailing whitespace ***************************************************
set list listchars=tab:»·,trail:·
set showbreak=↪

if has("gui_running")
  set guioptions=egmrt
  " set guifont=Menlo
  " set guifont=Source\ Code\ Pro\ for\ Powerline
  " set guifont=Meslo\ LG\ S\ DZ\ Regular\ for\ Powerline:h13
  set guifont=Fantasque\ Sans\ Mono
endif

" Turn backup off
set nobackup
set nowritebackup
set noswapfile

" Better File Opening *********************************************************
set wildmode=longest,list
set wildmenu "turn on wild menu
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.rbenv/**
set wildignore+=*/.nx/**,*.app

" Use \ as the leader *********************************************************
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","
" nmap <silent> <leader>s :set spell!<CR>

" Put the cursor at the beginning of the edit after . macro *******************
nmap . .`[

" Show syntax highlighting groups for word under cursor ***********************
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Reload Chrome
nmap <leader>l :w\|:silent !chrome-cli reload<cr>

" set paste
set cpoptions+=$
set t_Co=256
nmap <C-k> i<CR><Esc>

set laststatus=2
set cursorline
nnoremap <leader>s :Switch<cr>
nmap <Leader>R :source $MYVIMRC<cr>

" List of buffers
function! BufList()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! BufOpen(e)
  execute 'buffer '. matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap [ctrlp] <Nop>
nmap <space> [ctrlp]

nnoremap [ctrlp]t :<C-u>FZF<cr>
nnoremap <silent> [ctrlp]e :call fzf#run({
\   'source':      reverse(BufList()),
\   'sink':        function('BufOpen'),
\   'options':     '+m',
\   'tmux_height': '40%'
\ })<CR>


nnoremap <silent> [ctrlp]/ :<C-u>Ag 

nnoremap [ctrlp]rm :FZF app/models<cr>
nnoremap [ctrlp]rv :FZF app/views<cr>
nnoremap [ctrlp]rc :FZF app/controllers<cr>
nnoremap [ctrlp]ra :FZF app/assets<cr>
nnoremap [ctrlp]rh :FZF app/helpers<cr>
nnoremap [ctrlp]rl :FZF app/<cr>
nnoremap [ctrlp]rs :FZF spec/<cr>

nnoremap <leader>d :noh<cr>

set noswapfile
" au BufRead,BufNewFile *.handlebars,*.hbs set ft=html syntax=handlebars

" set colorcolumn=81
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<cr>
nmap <leader>fe :edit %%
nmap <leader>fv :view %%

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>fm :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COPY CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CopyFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    redraw!
  endif
endfunction
map <leader>fc :call CopyFile()<cr>

function! RemoveFancyCharacters()
  let typo = {}
  let typo["“"] = '"'
  let typo["”"] = '"'
  let typo["‘"] = "'"
  let typo["’"] = "'"
  let typo["–"] = '--'
  let typo["—"] = '---'
  let typo["…"] = '...'
  :exe ":%s/".join(keys(typo), '\|').'/\=typo[submatch(0)]/ge'
endfunction
command! RemoveFancyCharacters :call RemoveFancyCharacters()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" InsertTime COMMAND
" Insert the current time
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! InsertTime :normal a<c-r>=strftime('%F %H:%M:%S.0 %z')<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FindConditionals COMMAND
" Start a search for conditional branches, both implicit and explicit
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! FindConditionals :normal /\<if\>\|\<unless\>\|\<and\>\|\<or\>\|||\|&&<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Diff tab management: open the current git diff in a tab
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! GdiffInTab tabedit %|vsplit|Gdiff

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPS TO JUMP TO SPECIFIC COMMAND-T TARGETS AND FILES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>gr :topleft :split config/routes.rb<cr>
function! ShowRoutes()
  " Requires 'scratch' plugin
  :topleft 100 :split __Routes__
  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
  " Delete everything
  :normal 1GdG
  " Put routes output in buffer
  :0r! bin/rake -s routes
  " Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . "_ "
  " Move cursor to bottom
  :normal 1GG
  " Delete empty trailing line
  :normal dd
endfunction
map <leader>gR :call ShowRoutes()<cr>

map <leader>xm <Plug>(xmpfilter-mark)
map <leader>xr <Plug>(xmpfilter-run)
map <C-c> :NERDTreeToggle<CR>
map <C-t> :TagbarToggle<CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

nmap <silent> <leader>rr :TestNearest<CR>
nmap <silent> <leader>ra :TestFile<CR>
nmap <silent> <leader>rs :TestSuite<CR>
nmap <silent> <leader>rl :TestLast<CR>

let g:test#strategy = 'dispatch'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_go_checker = 0

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete_enable_fuzzy_completion_start_length = 2
let g:neocomplete_enable_camel_case_completion = 0
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#max_list = 100
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#enable_auto_select = 1

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

nnoremap <leader>gt :GitGutterLineHighlightsToggle<cr>
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 0
let g:go_highlight_methods = 0
let g:go_highlight_structs = 0
