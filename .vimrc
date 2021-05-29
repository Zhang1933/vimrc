" sheme setting------------------------------{{{
if has('gui_running')
    set background=dark
    colorscheme solarized
endif
syntax on
set guifont=Consolas:h16
" }}}
" plug setting------{{{
"}}}
" template  {{{
augroup template
    autocmd bufnewfile *.cpp 0read ~/.vim/templates/head.cpp 
    autocmd bufnewfile *.sh 0read ~/.vim/templates/shell.sh
augroup END
"}}}
" Basic Settings ---------{{{
let mapleader='-'
let maplocalleader='-'
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set number
set autoindent
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

set incsearch hlsearch 
set backspace=indent,eol,start

nnoremap n nzz
nnoremap N Nzz

" }}}
" mapping and abbreviation----------{{{

inoremap <c-u> <esc>vawUea
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" 自动添加引号...
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>

"nnoremap H 0 
"nnoremap L $
inoremap jk <esc>
" super w...
nnoremap W 3w
nnoremap B 3b
nnoremap J 3j
nnoremap K 3k

noremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Left> <Nop>
noremap <Down> <Nop>

inoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Left> <Nop>
inoremap <Down> <Nop>

iabbrev mian main 


nnoremap  j gj
nnoremap  k gk
nnoremap  / /\v
nnoremap <leader>sh :nohlsearch<cr>
nnoremap <leader>N :setlocal number!<cr>

" 打开关闭quickfix 
nnoremap   <leader>q :call QuickfixToggle()<cr>
function! QuickfixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        let g:quickfix_return_to_window = winnr()
        copen
    else
        cclose
        execute g:quickfix_return_to_window . "wincmd w"
    endif
endfunction
cnoreabbrev w!! w !sudo tee > /dev/null %
nnoremap <leader>p :set paste!<cr>

" 添加空行
nnoremap <Leader>o o<Esc>0"_D
nnoremap <Leader>O O<Esc>0"_D

" }}}
" file specific settings ---------------------------------------------{{{
augroup filetype_py
    autocmd!
    autocmd FileType python  :nnoremap <buffer> <localleader>c I#<esc> 
    autocmd FileType python :inoreabbrev <buffer> def def ():<enter>return<esc>kbi  
augroup END

augroup filetype_cpp
    autocmd!
    autocmd FileType cpp :nnoremap <buffer> <leader>;  :execute "normal! mqA;\<lt>esc>`q"<cr>
    autocmd FileType cpp  set cindent
    autocmd FileType cpp :inoremap <buffer> { {<CR>}<ESC>O
    autocmd filetype cpp :nnoremap <silent> <F7> :<c-u>make %<<cr>
    autocmd filetype cpp :nnoremap <silent> <f8> :<c-u>term ./%<<cr>
augroup END

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
    autocmd FileType markdown :inoreabbrev <buffer> cap <center style="font-size:14px;color:#fffff;text-decoration:underline">img</center><esc>Fg
augroup END
" }}}
" statusline settings ---------------------{{{ 
set statusline=%f         " Path to the file
set statusline+=%=        " Switch to the right side
set statusline+=%l        " Current line
set statusline+=/         " Separator
set statusline+=%L        " Total lines
" }}}
" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
