
"""""""""""""""""""""""""""""""""""""
" coc-snippets configuration
"""""""""""""""""""""""""""""""""""""
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-l>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-h>'

" Use <C-j> for both expand and jump (make expand higher priority.)
"imap <C-j> <Plug>(coc-snippets-expand-jump)
" Use <C-l> for trigger snippet expand.


" Use <C-j> for select text for visual placeholder of snippet.
"nmap <C-z> coc#expandableOrJumpable()
"
"
"cnoremap <silent><expr> <TAB> coc#expandableOrJumpable()
"
"Map <tab> for trigger completion, completion confirm, snippet expand and jump
"like VSCode. >
let g:coc_snippet_next = '<tab>'

