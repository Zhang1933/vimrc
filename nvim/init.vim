source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/keys/mappings.vim
source $HOME/.config/nvim/general/vim-plug/plugins.vim
" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd  FileType vim  imap  " "
augroup END
" }}}colorscheme dracula
