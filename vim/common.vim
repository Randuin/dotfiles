set shell=zsh
set clipboard=unnamed

" Colors
syntax enable

let ayucolor="dark"
colorscheme ayu

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

" Setup
set fileencoding=utf-8
filetype plugin indent on
set hidden
set scrolloff=3
set ignorecase smartcase
set winwidth=80
set t_ti= t_te=
set lazyredraw
set ttyfast
set nojoinspaces
set mouse=
set inccommand=split

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
highlight Comment cterm=italic
set wrapscan

" Status Line *****************************************************************
set showcmd
set ruler " Show ruler

" show trailing whitespace ***************************************************
set list listchars=tab:»·,trail:·
autocmd BufNewFile,BufRead *.go set nolist
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

let g:netrw_localrmdir='rm -r'
" Use , as the leader *********************************************************
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","

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

set laststatus=2
set cursorline
nnoremap <leader>s :Switch<cr>
nmap <Leader>R :source $MYVIMRC<cr>


nnoremap <leader>d :noh<cr>

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
command! InsertTime :normal a<c-r>=strftime('%F %H:%M:%S.0 %z')<cr>
command! FindConditionals :normal /\<if\>\|\<unless\>\|\<and\>\|\<or\>\|||\|&&<cr>

nnoremap <leader>gt :GitGutterLineHighlightsToggle<cr>
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

let g:go_highlight_functions = 0
let g:go_highlight_methods = 0
let g:go_highlight_structs = 0
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.js syn match error contained "\<debugger\>"
au BufEnter *.coffee syn match error contained "\<debugger\>"
au BufEnter *.js syn match error contained "\<console.log\>"
au BufEnter *.coffee syn match error contained "\<console.log\>"

so ~/.vim/fzf.vim

noremap <Leader>dr :diffget REMOTE<CR>
noremap <Leader>dl :diffget LOCAL<CR>
noremap <Leader>db :diffget BASE<CR>

let g:tablabel =
      \ "%N%{flagship#tabmodified()} %{flagship#tabcwds('shorten',',')}"

set hidden
let g:racer_cmd = "/Users/randuin/.cargo/bin/racer"
let $RUST_SRC_PATH="<path-to-rust-srcdir>/src/"

let g:deoplete#enable_at_startup=1

let g:deoplete#sources={}
" let g:deoplete#sources._    = ['buffer', 'file', 'ultisnips']
" let g:deoplete#sources.ruby = ['buffer', 'member', 'file', 'tag', 'ultisnips']
" let g:deoplete#sources.vim  = ['buffer', 'member', 'file', 'ultisnips']
" let g:deoplete#sources['javascript.jsx'] = ['buffer', 'file', 'ultisnips', 'ternjs']
" let g:deoplete#sources.css  = ['buffer', 'member', 'file', 'omni', 'ultisnips']
" let g:deoplete#sources.scss = ['buffer', 'member', 'file', 'omni', 'ultisnips']
" let g:deoplete#sources.html = ['buffer', 'member', 'file', 'omni', 'ultisnips']

let g:UltiSnipsUsePythonVersion=3
inoremap <C-x><C-k> <NOP>
let g:UltiSnipsExpandTrigger='<C-j>'
let g:UltiSnipsListSnippets='<C-s>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'
