nnoremap [Space] <Nop>
nmap  <Space> [Space]
xmap  <Space> [Space]

nnoremap [Space]t :<C-u>FZF<cr>
nnoremap <silent> [Space]e :call fzf#run({
\   'source':      reverse(BufList()),
\   'sink':        function('BufOpen'),
\   'options':     '+m',
\   'tmux_height': '40%'
\ })<CR>
nnoremap <silent> [Space]/ :<C-u>Ag 
nnoremap [Space]rm :<C-u>FZF app/models<cr>
nnoremap [Space]rv :<C-u>FZF app/views<cr>
nnoremap [Space]rc :<C-u>FZF app/controllers<cr>
nnoremap [Space]ra :<C-u>FZF app/assets<cr>
nnoremap [Space]rh :<C-u>FZF app/helpers<cr>
nnoremap [Space]rl :<C-u>FZF app/<cr>
nnoremap [Space]rs :<C-u>FZF spec/<cr>

function! BufList()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! BufOpen(e)
  execute 'buffer '. matchstr(a:e, '^[ 0-9]*')
endfunction

if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
endif
