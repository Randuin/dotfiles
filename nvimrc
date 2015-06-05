so ~/.dotfiles/vimscripts/plugins.vim
Plug 'kassio/neoterm'
so ~/.vimrc.common

" let test#strategy = "neoterm"
" let g:neoterm_size = '15'
let g:neoterm_rspec_lib_cmd = 'bin/rspec'

nmap <silent> <leader>rs :call neoterm#test#run('all')<cr>
nmap <silent> <leader>ra :call neoterm#test#run('file')<cr>
nmap <silent> <leader>rr :call neoterm#test#run('current')<cr>
nmap <silent> <leader>rl :call neoterm#test#rerun()<cr>

nmap <silent> <leader>rc :call neoterm#close_all()<cr>
nmap <silent> <leader>rx :call neoterm#clear()<cr>

tnoremap <s-esc> <C-\><C-n>
