" mapping and abbreviation----------{{{

" 在输入模式下快捷将所输入的单词小写转化为大写
inoremap <c-u> <esc>vawUea
"
" 快捷打开映射设置并编辑
nnoremap <leader>ev :vsplit ~/.vim/general/keys/mappings.vim<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" 快捷添加引号...
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>
"
" 引号补全
inoremap " ""<Left>
inoremap ' ''<left>

" 快捷回到normal模式
inoremap jk <esc>

nnoremap  / /\v
" 取消搜索时的高亮
nnoremap <leader>sh :nohlsearch<cr>

" 取消显示行号
nnoremap <leader>N :setlocal number!<cr>

" 提权保存文件
cnoreabbrev w!! w !sudo tee > /dev/null %
"cnoremap terminal split | term
"nnoremap <leader>p :set paste!<cr>

" 快捷添加空行
nnoremap <Leader>o o<Esc>0"_D
nnoremap <Leader>O O<Esc>0"_D

" 括号匹配 如果为行末，或者下一个字符为空格，自动匹配 
function! ConditionalPairMap(open, close,type) abort
 let line = getline('.')
  " 如果是大括号，当只为本行中最后一个字符才带回车补全。否则为不回车补全
  "echom a:big
  if a:type==1 
    if col('.')>strlen(line)
        return a:open."\<cr>".a:close."\<esc>O"
    endif
  endif
  " 如果后面为不为字母或数字,且不为右括号，则补全
  if (col('.') > strlen(line) || ( line[col('.')-1] !~ '[a-z0-9A-Z]' && line[col('.')-1] !=a:close ))
    return a:open.a:close."\<ESC>i"
  else
    return a:open
  endif
endfunction
inoremap <expr> ( ConditionalPairMap('(', ')',0)
inoremap <expr> [ ConditionalPairMap('[', ']',0)
inoremap <expr> { ConditionalPairMap('{','}',1)


nnoremap g* g*``

"  quickfix的一些配置
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

" 全文粘贴复制
nnoremap <leader>gc  gg"+yG``

"防止误触
nnoremap <S-D> <Nop>    

nnoremap n nzz    
nnoremap N Nzz    
noremap  j gj
noremap  k gk
     
" super w...    
noremap W 3w
noremap B 3b
noremap J 3j
noremap K 3k
noremap L 3l
noremap H 3h

" 快捷打开当前目录文件夹
cnoreabbrev xdg silent !xdg-open .

" 分屏时，平滑的改变buffer大小,按住Alt - Shift - </> 组合键
" 垂直
noremap <Esc>< :vertical res -2<Enter>
nnoremap <Esc>> :vertical res +2<Enter>
" 水平 Alt - Shift - +/_组合键
nnoremap <Esc>+ :res +2<Enter>
nnoremap <Esc>_ :res -2<Enter>

" 关闭buffer而不退出分屏，返回上一个buffer

nnoremap <leader>d :bp\|bd #<CR>

" }}}
