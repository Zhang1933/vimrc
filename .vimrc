source $HOME/.vim/general/settings.vim
source $HOME/.vim/general/keys/mappings.vim
source $HOME/.vim/general/vim-plug/plugins.vim
" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd  FileType vim  imap  " "
augroup END
" }}}
