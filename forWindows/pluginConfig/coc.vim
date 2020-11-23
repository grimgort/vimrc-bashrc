

function! Show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  "elseif (index(['cmake'], &filetype) >= 0)
          ":CocCommand cmake.onlineHelp
  else
    call CocAction('doHover')
  endif
endfunction
"showSignatureHelp
autocmd User CocJumpPlaceholder call
      \ CocActionAsync('showSignatureHelp')
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
"autocmd CursorHold * silent call CocActionAsync('doHover')

