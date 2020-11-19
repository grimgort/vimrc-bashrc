
"-----------------
"" Plugin fugitive
"-----------------
autocmd BufReadPost fugitive://* set bufhidden=delete
nnoremap <leader>pdl :diffget //2<CR>
nnoremap <leader>pdr :diffget //3<CR>
"autocmd QuickFixCmdPost *grep* cwindow "alow to choose file in quickFiXList whit :Ggrep command
"nnoremap <silent> <leader>a :Gstatus<cr>

" let g:EasyGrepOpenWindowOnMatch=0

