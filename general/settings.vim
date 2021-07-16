 " template  {{{
augroup template
    autocmd bufnewfile *.cpp 0read ~/.config/nvim/tempaltes/init.cpp
    autocmd bufnewfile *.sh 0read  ~/.config/nvim/templates/init.sh
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
filetype plugin indent on
syntax on

set incsearch hlsearch 
set backspace=indent,eol,start

set mouse=a
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

" F5 编译运行
nnoremap <buffer> <f5> :call CompileRun()<cr>
function! CompileRun()
    execute "w"
    if &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!./%<"
    elseif &filetype == 'python'
        exec "!python3 %"
    elseif &filetype == 'sh'
        exec "!bash %"
    endif
endfunction

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

set nowrap                              " Display long lines as just one line
" }}}
" file specific settings -------------------------------{{{

" python 
augroup filetype_py
    autocmd!
    autocmd FileType python  :nnoremap <buffer> <localleader>c I#<esc> 
    "autocmd FileType python :inoreabbrev <buffer> def def ():<enter>return<esc>kbi  
augroup END

" cpp
augroup filetype_cpp
    autocmd!
    autocmd FileType cpp :nnoremap <buffer> <leader>;  :execute "normal! mqA;\<lt>esc>`q"<cr>
    autocmd FileType cpp  set cindent
    " 会插入一个空格占位
    autocmd FileType cpp :inoremap <buffer> { {<CR>}<ESC>O
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
    autocmd FileType markdown :inoreabbrev <buffer> Cap <center style="font-size:14px;color:#fffff;text-decoration:underline"></center><esc>F>
    autocmd FileType markdown :onoremap <silent><buffer a` :execute ":silent normal! F`vf`"<cr>
    autocmd FIleType markdown :onoremap <silent><buffer> i` :execute ":silent normal! F`lvt`"<cr>
augroup END
" ----}}}
