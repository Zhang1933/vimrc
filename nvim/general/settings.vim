 " template  {{{
augroup template
    autocmd bufnewfile *.cpp 0read ~/.config/nvim/general/templates/head.cpp
    autocmd bufnewfile *.sh 0read  ~/.config/nvim/general/templates/bash.sh
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
" }}}
" file specific settings -------------------------------{{{

" python 
augroup filetype_py
    autocmd!
    autocmd FileType python  :nnoremap <buffer> <localleader>c I#<esc> 
    autocmd BufWinEnter *.py nnoremap <F6>:w<CR>:terminal python3 -m pdb '%:p'<CR>
augroup END

" cpp
augroup filetype_cpp
    autocmd!
    autocmd FileType cpp :nnoremap <buffer> <leader>;  :execute "normal! mqA;\<lt>esc>`q"<cr>
    autocmd FileType cpp  set cindent
    "autocmd FileType cpp :inoremap <buffer> { {<CR>}<ESC>O

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
    autocmd FileType markdown :onoremap <silent><buffer> a` :execute ":silent normal! ?`\rV/`\r$"<cr>
    autocmd FIleType markdown :onoremap <silent><buffer> i` :execute ":silent normal! ?`\rj0v/`\rk$"<cr>
    autocmd FileType markdown :vnoremap i` ?`<cr>j0o/`<cr>k$
    autocmd FileType markdown :syntax match markdownError "\w\@<=\w\@="

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
" ----}}}
