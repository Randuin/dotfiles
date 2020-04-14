so ~/.vim/fzf.vim

set shell=zsh
set clipboard=unnamed

" Colors
syntax enable
set re=1

" let ayucolor="dark"
" set t_Co=256
" colorscheme dracula
" set termguicolors
set t_ZH=^[[3m
set t_ZR=^[[23m

if empty($TMUX) && empty($STY)
  " See https://gist.github.com/XVilka/8346728.
  if $COLORTERM =~# 'truecolor' || $COLORTERM =~# '24bit'
    if has('termguicolors')
      " See :help xterm-true-color
      if $TERM =~# '^screen'
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
      endif
      set termguicolors
    endif
  endif
endif

set background=light
colorscheme open-color

highlight Cursor ctermfg=white ctermbg=black guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

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

" Put the cursor at the beginning of the edit after . macro *******************
nmap . .`[

" Show syntax highlighting groups for word under cursor ***********************
nmap <F10> :call <SID>SynStack()<CR>
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
set laststatus=2
set cursorline

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
au BufEnter *.ts syn match error contained "\<debugger\>"
au BufEnter *.tsx syn match error contained "\<debugger\>"
au BufEnter *.coffee syn match error contained "\<debugger\>"
au BufEnter *.js syn match error contained "\<console.log\>"
au BufEnter *.ts syn match error contained "\<console.log\>"
au BufEnter *.tsx syn match error contained "\<console.log\>"
au BufEnter *.coffee syn match error contained "\<console.log\>"

set hidden

hi tsxTagName guifg=#d45750
hi! link jsxTagName tsxTagName
hi tsxCloseTag guifg=#00ff00
hi tsxCloseString guifg=#6272a4
hi! link jsxCloseTag tsxCloseTag
hi! link jsxCloseString tsxCloseString
hi tsxOpenPunct guifg=#a1d9e3
hi! link tsxClosePunct tsxOpenPunct
hi! link jsxOpenPunct tsxOpenPunct
hi! link jsxClosePunct tsxOpenPunct
hi tsxComponentName guifg=#ff473d
hi! link jsxComponentName tsxComponentName

hi! link javaScriptLineComment typescriptLineComment

hi jsObjectValue guifg=#b49551
hi jsString guifg=#b49551 guibg=#fff5de
hi! link tsxString jsxString
hi! link jsxString jsxString
hi! link graphqlVariable jsObjectValue

hi jsObjectKey guifg=#7a6537
hi jsFuncCall guifg=#769863
hi! link jsFuncName jsFuncCall
hi! link graphqlName jsFuncCall
hi jsObjectBraces guifg=#6272a4

hi jsAsyncKeyword guifg=#9c64a1

hi tsxAttributeBraces guifg=#F99575
hi! link jsBraces tsxAttributeBraces
hi! link jsDestructuringBraces tsxAttributeBraces
hi! link graphqlBraces tsxAttributeBraces

hi tsxEqual guifg=#F99575
hi tsxTypeBraces guifg=#999999
hi tsxTypes guifg=#666666
hi tsxAttrib guifg=#f3836f cterm=italic
hi ReactState guifg=#ddbdff guibg=#362e40
hi ReactProps guifg=#D19A66
hi Events ctermfg=204 guifg=#56B6C2
hi ReduxKeywords ctermfg=204 guifg=#C678DD
hi WebBrowser ctermfg=204 guifg=#56B6C2
hi ReactLifecycleMethods ctermfg=204 guifg=#D19A66
hi typescriptStringD guifg=#e8ce77 guibg=#2b2719
hi typescriptNumber guifg=#e8ce77 guibg=#2b2719
hi typescriptBoolean guifg=#e8ce77 guibg=#2b2719
hi jsFuncBraces guifg=#ffb86c
hi jsBrackets guifg=#50fa7b
hi jsFrom guifg=#9d6fde
hi jsImport guifg=#bd93f9
hi! link jsModuleBraces jsFuncBraces
hi! link CocErrorSign WarningMsg
hi! link CocWarningSign Number
hi! link CocInfoSign Type


let test#strategy = "neoterm"
" let g:neoterm_size = '15'
let g:neoterm_rspec_lib_cmd = 'bin/rspec'

" nmap <silent> <leader>rs :call neoterm#test#run('all')<cr>
" nmap <silent> <leader>ra :call neoterm#test#run('file')<cr>
" nmap <silent> <leader>rr :call neoterm#test#run('current')<cr>
" nmap <silent> <leader>rl :call neoterm#test#rerun()<cr>

nmap <silent> <leader>rs :TestSuite<cr>
nmap <silent> <leader>ra :TestFile<cr>
nmap <silent> <leader>rr :TestNearest<cr>
nmap <silent> <leader>rl :TestLast<cr>

nmap <silent> <leader>rc :call neoterm#close_all()<cr>
nmap <silent> <leader>rx :call neoterm#clear()<cr>

let g:ruby_path = system('echo $HOME/.rbenv/shims')
