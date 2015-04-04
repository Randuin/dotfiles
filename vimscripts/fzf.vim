nnoremap [FuzzySearch] <Nop>
nmap <space> [FuzzySearch]
nnoremap [FuzzySearch]t :<C-u>FZF<cr>
nnoremap <silent> [FuzzySearch]e :call fzf#run({
\   'source':      reverse(BufList()),
\   'sink':        function('BufOpen'),
\   'options':     '+m',
\   'tmux_height': '40%'
\ })<CR>
nnoremap <silent> [FuzzySearch]/ :<C-u>Ag 
nnoremap [FuzzySearch]rm :<C-u>FZF app/models<cr>
nnoremap [FuzzySearch]rv :<C-u>FZF app/views<cr>
nnoremap [FuzzySearch]rc :<C-u>FZF app/controllers<cr>
nnoremap [FuzzySearch]ra :<C-u>FZF app/assets<cr>
nnoremap [FuzzySearch]rh :<C-u>FZF app/helpers<cr>
nnoremap [FuzzySearch]rl :<C-u>FZF app/<cr>
nnoremap [FuzzySearch]rs :<C-u>FZF spec/<cr>

function! BufList()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! BufOpen(e)
  execute 'buffer '. matchstr(a:e, '^[ 0-9]*')
endfunction
