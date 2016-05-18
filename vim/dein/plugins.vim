call dein#add('Shougo/dein.vim')
call dein#add('mkarmona/colorsbox', { 'hook_post_source': 'colorscheme colorsbox-material' })

call dein#add('junegunn/fzf', { 'build': './install', 'merged': 0 })
call dein#add('junegunn/fzf.vim', { 'depends': 'junegunn/fzf' })

call dein#add('hail2u/vim-css3-syntax', { 'on_ft': ['css', 'scss', 'sass'] })

call dein#add('mxw/vim-jsx', { 'on_ft': ['javascript'] })
call dein#add('jiangmiao/simple-javascript-indenter', { 'on_ft': ['javascript'] })
call dein#add('othree/yajs.vim', { 'on_ft': ['javascript'] })
call dein#add('othree/javascript-libraries-syntax.vim', { 'on_ft': ['javascript'] })
call dein#add('jelera/vim-javascript-syntax', { 'on_ft': ['javascript'] })

" [[plugins]]
" repo = 'thinca/vim-ft-diff_fold'
" on_ft = 'diff'
" 
" [[plugins]]
" repo = 'thinca/vim-ft-vim_fold'
" on_ft = 'vim'
" 
" [[plugins]]
" repo = 'thinca/vim-ft-help_fold'
" on_ft = 'help'
" 
" [[plugins]]
" repo = 'cespare/vim-toml'
" on_ft = 'toml'
" 
" [[plugins]]
" repo = 'elzr/vim-json'
" on_ft = 'json'
" 
" [[plugins]]
" repo = 'vim-jp/autofmt'
" 
" [[plugins]]
" repo = 'kana/vim-textobj-user'
" 
" # Operators
" [[plugins]]
" repo = 'kana/vim-operator-user'
" 
" [[plugins]]
" repo = 'rcmdnk/vim-markdown'
" on_ft = ['markdown', 'mkd']
" 
" [[plugins]]
" repo = 'marijnh/tern_for_vim'
" on_ft = 'javascript'
" build = 'npm install'
" 
" [[plugins]]
" repo = 'vim-ruby/vim-ruby'
" on_map = '<Plug>'
" on_ft = 'ruby'
" 
" [[plugins]]
" repo = 'thinca/vim-themis'
" 
" [[plugins]]
" repo = 'cocopon/iceberg.vim'
" 
" [[plugins]]
" repo = 'kchmck/vim-coffee-script'
" on_ft = 'coffee'
