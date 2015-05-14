so ~/.dotfiles/vimscripts/plugins.vim
so ~/.vimrc.common

let test#strategy = "neoterm"
let g:neoterm_size = '15'
nnoremap <silent> <leader>rc :call neoterm#close_all()<cr>
nnoremap <silent> <leader>rx :call neoterm#clear()<cr>

tnoremap <esc><esc> <C-\><C-n>
