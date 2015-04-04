nnoremap [FuzzySearch] <Nop>
nmap <space> [FuzzySearch]

let g:unite_source_rec_async_command='ag --nocolor --nogroup -l -g ""'
call unite#custom#source(
      \ 'buffer,file_rec,file_rec/async,file_rec/git', 'matchers',
      \ ['converter_relative_word', 'matcher_fuzzy',
      \  'matcher_project_ignore_files'])
call unite#custom#source(
      \ 'file_mru', 'matchers',
      \ ['matcher_project_files', 'matcher_fuzzy',
      \  'matcher_hide_hidden_files', 'matcher_hide_current_file'])
nnoremap [FuzzySearch]t :<C-u>Unite file_rec/async<cr>

nnoremap <silent> [FuzzySearch]/ :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --smart-case'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_encoding = 'utf-8'
endif
nnoremap [FuzzySearch]o :<C-u>Unite outline -no-start-insert -resume<cr>
nnoremap [FuzzySearch]rm :<C-u>Unite app/models<cr>
nnoremap [FuzzySearch]rv :<C-u>Unite app/views<cr>
nnoremap [FuzzySearch]rc :<C-u>Unite app/controllers<cr>
nnoremap [FuzzySearch]ra :<C-u>Unite app/assets<cr>
nnoremap [FuzzySearch]rh :<C-u>Unite app/helpers<cr>
nnoremap [FuzzySearch]rl :<C-u>Unite app/<cr>
nnoremap [FuzzySearch]rs :<C-u>Unite spec/<cr>
