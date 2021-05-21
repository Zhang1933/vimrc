" sheme setting------------------------------{{{
if has('gui_running')
    set background=dark
    colorscheme solarized
endif
syntax on
set guifont=Consolas:h16
" }}}
" plug------{{{
"}}}
" Basic Settings ---------{{{
let mapleader='-'
let maplocalleader='-'
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set number
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set autoindent


set incsearch hlsearch 
set backspace=indent,eol,start

nnoremap n nzz
nnoremap N Nzz
"let g didit = 0
"autocmd! InsertEnter * if ! didit | call feedkeys("\<C-\>\<C-o>:nohlsearch|let didit = 1\<CR>", 'n') | endif
"autocmd! InsertLeave * let didit = 0
" }}}
" mapping and abbreviation----------{{{

inoremap <c-u> <esc>vawUea
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>
nnoremap H 0 
nnoremap L $
inoremap jk <esc>

"inoremap <esc> <nop>

nnoremap <Right> <nop>
nnoremap <Up> <nop>
nnoremap <left> <nop>
nnoremap <down> <nop>

inoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <left> <nop>
inoremap <down> <nop>

iabbrev mian main 

" 括号操作define movement

nnoremap  j gj
nnoremap  k gk
nnoremap <c-a> ggvG
nnoremap  / /\v
nnoremap <leader>sh :nohlsearch<cr>
nnoremap <leader>N :setlocal number!<cr>

inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
"inoremap [ []<ESC>i

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
