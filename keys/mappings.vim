" mapping and abbreviation----------{{{

inoremap <c-u> <esc>vawUea
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
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


" }}}
