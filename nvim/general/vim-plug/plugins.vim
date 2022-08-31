"vim-plug manage {{{
call plug#begin("~/.vim/plugged")
Plug 'scrooloose/nerdtree'
Plug 'godlygeek/tabular'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'plasticboy/vim-markdown'
Plug 'Yggdroot/indentLine'
Plug 'lambdalisue/suda.vim'
call plug#end()

"--------}}}
" nerdtree ----{{{
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window left.
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
"    \ quit | endif

nnoremap <C-n> :NERDTreeToggle<CR>
" show hidden 
let NERDTreeShowHidden=1
"----}}}
"coc ------{{{

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif


" Use gk to show documentation in preview window.
nnoremap  gk :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" GoTo code navigation.
nmap  gd <Plug>(coc-definition)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <nowait><expr> <C-j> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <nowait><expr> <C-k> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

autocmd FileType python let b:coc_root_patterns = [ 'Pipfile','.git','.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json']

let g:coc_global_extensions = ['coc-json','coc-clangd','coc-html','coc-yaml','coc-pyright']


"----}}}
" vim-fugitive -- {{{
"set statusline+=%{FugitiveStatusline()}
" ----}}}
"----vim-markdown{{{
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
"----}}}
"----Yggdroot/indentLine--{{{
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"----}}}
