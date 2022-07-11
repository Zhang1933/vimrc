 " template  {{{
augroup template
    autocmd bufnewfile *.cpp 0read ~/.config/nvim/general/templates/head.cpp
    autocmd bufnewfile *.sh 0read  ~/.config/nvim/general/templates/bash.sh
    autocmd bufnewfile *.py 0read ~/.config/nvim/general/templates/head.py
    autocmd bufnewfile *.c 0read ~/.config/nvim/general/templates/head.c
augroup END
"}}}
" Basic Settings ---------{{{
set nocompatible
let mapleader='-'
set scrolloff=7
let maplocalleader='-'
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set number
set wrap
filetype plugin indent on
syntax on

set incsearch hlsearch 
set backspace=indent,eol,start


" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

if  has('vim')
    set wildmenu
    set wildmode=list:full
endif

" 设置状态栏
set statusline=%f         " Path to the file
set statusline+=%M%R
"set statusline+=%{FugitiveStatusline()}
set statusline+=%=        " Switch to the right side
set statusline+=%l        " Current line
set statusline+=/         " Separator
set statusline+=%L        " Total lines
set statusline+=\ %c
autocmd BufEnter * syntax sync fromstart

set ignorecase

set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1

" ----}}}
" file specific settings -------------------------------{{{

" python 
augroup filetype_py
    autocmd!
    autocmd FileType python  :nnoremap <buffer> <localleader>c I#<esc> 
    autocmd BufWinEnter *.py nnoremap <F6>:w<CR>:terminal python3 -m pdb '%:p'<CR>
augroup END


" C++的build and run ,From my build-tools-wrapper plugin
function Get_metrics() abort
  let l:qf = getqflist()
  let l:recognized = filter(qf, 'get(v:val, "valid", 1)')
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
      let exec_line="! ./%<"
      if filereadable(input)
            let exec_line = "! ./%< < input.txt"
      endif 
      exe exec_line
  elseif  &filetype=="python"
      if has ('nvim')
          exec ":split | term" 
      else 
          exec "term"
      endif
  endif
endfunction

"nnoremap <f5> :<C-U>call Build_and_run(expand('%'))<cr>
" cpp

augroup filetype_cpp
    autocmd!
    " C文件添加行末分号
    autocmd FileType cpp,c :nnoremap <buffer> <leader>;  :execute "normal! mqA;\<lt>esc>`q"<cr>
    autocmd FileType cpp,c  set cindent
    "autocmd FileType cpp :inoremap <buffer> { {<CR>}<ESC>O
    " C文件f5一键编译 
    autocmd FileType cpp : nnoremap <f5> :<C-U>call Build_and_run(expand('%'))<cr>
augroup END

" md
augroup filetype_md
    autocmd!
    " headline
    autocmd FileType markdown :onoremap <silent><buffer> ih :<c-u>execute ":silent normal! ?^#\rwvg_"<cr>
    autocmd FIleType markdown :onoremap <silent><buffer> ah :<c-u>execute ":silent normal! ?^#\rvg_"<cr>
    autocmd FileType markdown :onoremap <silent><buffer> ac :<c-u>execute ":silent normal! ?^```\rv/```\r$"<cr>
    autocmd FileType markdown :onoremap <silent><buffer> ic :<c-u>execute ":silent normal! ?^```\rjv/```\rbg_"<cr>
        
    " insert link,img,space abbrevation
    autocmd FileType markdown :inoreabbrev <buffer> Link []()<esc>F[
    autocmd FileType markdown :inoreabbrev <buffer> Img ![]()<esc>F[
    autocmd FileType markdown :inoremap <buffer> <localleader><space> &ensp;&ensp;
    autocmd FileType markdown :onoremap <silent><buffer> a` :execute ":silent normal! ?`\rV/`\r$"<cr>
    autocmd FIleType markdown :onoremap <silent><buffer> i` :execute ":silent normal! ?`\rj0v/`\rk$"<cr>
    autocmd FileType markdown :vnoremap i` ?`<cr>j0o/`<cr>k$
    autocmd FileType markdown :syntax match markdownError "\w\@<=\w\@="

    autocmd FileType markdown :nnoremap <buffer><localleader>*  0i**<esc>$a**<esc>

"" vim -b : edit binary using xxd-format!
"augroup Binary
"  au!
"  au BufReadPre  *.bin let &bin=1
"  au BufReadPost *.bin if &bin | %!xxd
"  au BufReadPost *.bin set ft=xxd | endif
"  au BufWritePre *.bin if &bin | %!xxd -r
"  au BufWritePre *.bin endif
"  au BufWritePost *.bin if &bin | %!xxd
"  au BufWritePost *.bin set nomod | endif
"augroup END
augroup END

"html 按%标签跳转
augroup filetype_html
    autocmd!
    " % 键 html 对应标签跳转
    autocmd BufRead *.html runtime macros/matchit.vim  
    " html 取消 wrap,不用filetype可能出现用模板识别不出来的的情况
    autocmd BufRead *.html setlocal nowrap
augroup END

" ----}}}
