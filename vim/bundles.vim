if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 't9md/vim-ruby-xmpfilter'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'itchyny/lightline.vim'

NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'chriskempson/base16-vim'

NeoBundleLazy 'Shougo/unite.vim', {
      \ 'commands' : [{ 'name' : 'Unite',
      \                 'complete' : 'customlist,unite#complete_source'}],
      \ 'depends' : 'Shougo/neomru.vim',
      \ }
NeoBundleLazy 'Shougo/unite-build'
NeoBundleLazy 'Shougo/unite-outline'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'kyuhi/vim-emoji-complete'

NeoBundle 'majutsushi/tagbar'
NeoBundle 'junegunn/rainbow_parentheses.vim'

NeoBundle 'junegunn/vim-peekaboo'
NeoBundle 'osyo-manga/vim-over'

" File type specific
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundleLazy 'fatih/vim-go', {
      \ 'mappings' : '<Plug>',
      \ 'filetypes' : 'go'
      \ }
NeoBundleLazy 'tpope/vim-markdown', {
      \ 'mappings' : '<Plug>',
      \ 'filetypes' : 'markdown'
      \ }
NeoBundle 'tpope/vim-rails'
NeoBundleLazy 'vim-ruby/vim-ruby', {
      \ 'mappings' : '<Plug>',
      \ 'filetypes' : 'ruby'
      \ }
NeoBundleLazy 'jgdavey/vim-blockle', {
      \ 'mappings' : '<Plug>',
      \ 'filetypes' : 'ruby'
      \ }
NeoBundleLazy 'ecomba/vim-ruby-refactoring', {
      \ 'mappings' : '<Plug>',
      \ 'filetypes' : 'ruby'
      \ }
NeoBundleLazy 'groenewege/vim-less', {
      \ 'mappings' : '<Plug>',
      \ 'filetypes' : 'less'
      \ }
NeoBundleLazy 'kchmck/vim-coffee-script', {
      \ 'mappings' : '<Plug>',
      \ 'filetypes' : 'coffee'
      \ }
NeoBundleLazy 'mxw/vim-jsx', {
      \ 'mappings' : '<Plug>',
      \ 'filetypes' : 'jsx'
      \ }
NeoBundleLazy 'othree/yajs.vim', {
      \ 'mappings' : '<Plug>',
      \ 'filetypes' : 'javascript'
      \ }
NeoBundleLazy 'othree/javascript-libraries-syntax.vim', {
      \ 'mappings' : '<Plug>',
      \ 'filetypes' : 'javascript'
      \ }

NeoBundle 'janko-m/vim-test'
NeoBundle 'ngmy/vim-rubocop'
NeoBundle 'yegappan/greplace'
NeoBundle 'idanarye/vim-merginal'

call neobundle#end()
filetype plugin indent on

NeoBundleCheck

if neobundle#tap('unite.vim')
  so ~/.dotfiles/vimscripts/unite.vim
  call neobundle#untap()
endif
