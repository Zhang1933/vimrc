" operator in normal
"nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
" movement in visual
"vnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>
"function! GrepOperator(type)
"    echom a:type
"endfunction
"function! GrepOperator(type)
"
"    if a:type ==# 'v'
"        execute "normal! `<v`>y"
"    elseif a:type ==# 'char'
"        execute "normal! `[v`]y"
"    else
"        return
"    endif
"
"    silent execute "grep! -R " . shellescape(@@) . " ." 
"    copen 
"    let @@ = saved_unnamed_register
"endfunction
"function! s:GrepOperator(type)
"    let saved_unnamed_register =@@
"
"    if a:type ==# 'v'
"        normal! `<v`>y
"    elseif a:type ==# 'char'
"        normal! `[y`]
"    else
"        return
"    endif
"
"    silent execute "grep! -R " . shellescape(@@) . " ."
"
"    let @@ = saved_unnamed_register
"endfunction
