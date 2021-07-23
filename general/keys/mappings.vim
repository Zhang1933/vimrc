" mapping and abbreviation----------{{{

inoremap <c-u> <esc>vawUea
" 添加映射
nnoremap <leader>ev :vsplit ~/.vim/general/keys/mappings.vim<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" 自动添加引号...
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>
inoremap " ""<Left>
inoremap ' ''<left>

inoremap jk <esc>

"noremap <Right> <Nop>
"noremap <Up> <Nop>
"noremap <Left> <Nop>
"noremap <Down> <Nop>

"inoremap <Right> <Nop>
"inoremap <Up> <Nop>
"inoremap <Left> <Nop>
"inoremap <Down> <Nop>

iabbrev mian main 

nnoremap  / /\v
nnoremap <leader>sh :nohlsearch<cr>
nnoremap <leader>N :setlocal number!<cr>

noreabbrev w!! w !sudo tee > /dev/null %
nnoremap <leader>p :set paste!<cr>

" 添加空行
nnoremap <Leader>o o<Esc>0"_D
nnoremap <Leader>O O<Esc>0"_D

" 括号匹配 如果为行末，或者下一个字符为空格，自动匹配 
function! ConditionalPairMap(open, close) abort
 let line = getline('.')
  " 如果后面为不为字母或数字加括号
  if col('.') > strlen(line) || ( line[col('.')-1] !~ '[a-z0-9A-Z]')
    return a:open.a:close."\<ESC>i"
  else
    return a:open
  endif
endfunction
inoremap <expr> ( ConditionalPairMap('(', ')')
inoremap <expr> [ ConditionalPairMap('[', ']')


" From my build-tools-wrapper plugin
function Get_metrics() abort
  let l:qf = getqflist()
  let l:recognized = filter(qf, 'get(v:val, "valid", 1)')
  " TODO: support other locales, see lh#po#context().tranlate()
  let l:errors   = filter(copy(recognized), 'v:val.type == "E" || v:val.text =~ "\\v^ *(error|erreur)"')
  let l:warnings = filter(copy(recognized), 'v:val.type == "W" || v:val.text =~ "\\v^ *(warning|attention)"')
  let l:res = { 'all': len(qf), 'errors': len(errors), 'warnings': len(warnings) }
  return res
endfunction

function Build_and_run(file) abort
  " to make sure the buffer is saved
  if &filetype =="cpp"
      let l:tgt  = fnamemodify(a:file, ':r')
      exe 'update ' . a:file
      exe 'make ' . tgt
      if Get_metrics().errors
        echom "Error detected, execution aborted"
        copen
        return
      endif
      let path = fnamemodify(a:file, ':p:h')
      let input = path.'/input.txt'
      if filereadable(input)
            let exec_line = "! ./%< < input.txt"
      endif 
      exe exec_line
  elseif  &filetype=="python"
    " TODO 否则打开一个窗口，自己输入命令
      exec "term" 
  endif
endfunction
nnoremap <f5> :<C-U>call Build_and_run(expand('%'))<cr>

nnoremap g* g*``

" toggle quickfix
function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction
nnoremap <silent> <F2> :call ToggleQuickFix()<cr>
nnoremap  -n :cnext<cr>
nnoremap -l :cprevious<cr>


" }}}
