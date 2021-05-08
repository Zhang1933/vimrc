" sheme setting------------------------------{{{
if has('gui_running')
    set background=dark
    colorscheme solarized
endif
syntax on
set guifont=Consolas:h16
" }}}
" Basic Settings ---------{{{
let mapleader='-'
let maplocalleader='-'
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
" set cindent
set number
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

set incsearch  hlsearch
set backspace=indent,eol,start

" }}}
" mapping and abbreviation----------{{{

inoremap <c-d> <esc>ddi
inoremap <c-u> <esc>vawUea
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>
nnoremap H 0 
nnoremap L $
inoremap jk <esc>
inoremap <esc> <nop>

noremap <Right> <nop>
noremap <Up> <nop>
noremap <left> <nop>
noremap <down> <nop>

inoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <left> <nop>
inoremap <down> <nop>

iabbrev mian main 

" 括号操作define movement

onoremap il( :<c-u>normal! F)vi(<cr> 
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>

nnoremap  j gj
nnoremap  k gk
nnoremap <c-a> ggvG
nnoremap  / /\v
nnoremap <leader>sh :nohlsearch<cr>
nnoremap <leader>N :setlocal number!<cr>

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
augroup END

augroup filetype_md
    autocmd!
    " headline
    autocmd FileType markdown :onoremap <buffer> ih :<c-u>execute "normal! ?^#\rwvg_"<cr> 
    autocmd FIleType markdown :onoremap <buffer> ah :<c-u>execute "normal! ?^#\rvg_"<cr> 
    " insert link,img,space
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
