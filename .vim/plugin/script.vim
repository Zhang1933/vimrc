" scritpt
" 括号匹配 如果为行末，或者下一个字符为空格，自动匹配 
function! ConditionalPairMap(open, close) abort
 let line = getline('.')
  " 如果后面为不为字母或数字加括号
  if col('.') > strlen(line) || line[col('.')-1] !~ '[a-z0-9A-Z]'
    return a:open.a:close."\<ESC>i"
  else
    return a:open
  endif
endfunction

inoremap <expr> ( ConditionalPairMap('(', ')')
inoremap <expr> [ ConditionalPairMap('[', ']')
