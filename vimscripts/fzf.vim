if !has('python')
  echo 'In order to use pymatcher plugin, you need +python compiled vim'
else
  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif

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

" nnoremap [FuzzySearch] <Nop>
" nmap <space> [FuzzySearch]
" nnoremap [FuzzySearch]t :<C-u>CtrlP<cr>
" nnoremap <silent> [FuzzySearch]e :call fzf#run({
" \   'source':      reverse(BufList()),
" \   'sink':        function('BufOpen'),
" \   'options':     '+m',
" \   'tmux_height': '40%'
" \ })<CR>
" nnoremap <silent> [FuzzySearch]/ :<C-u>Ag 
" nnoremap [FuzzySearch]rm :<C-u>CtrlP app/models<cr>
" nnoremap [FuzzySearch]rv :<C-u>CtrlP app/views<cr>
" nnoremap [FuzzySearch]rc :<C-u>CtrlP app/controllers<cr>
" nnoremap [FuzzySearch]ra :<C-u>CtrlP app/assets<cr>
" nnoremap [FuzzySearch]rh :<C-u>CtrlP app/helpers<cr>
" nnoremap [FuzzySearch]rl :<C-u>CtrlP app/<cr>
" nnoremap [FuzzySearch]rs :<C-u>CtrlP spec/<cr>

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
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
endif
