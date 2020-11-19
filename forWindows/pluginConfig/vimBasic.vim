
""""""""""""""""""""""""""""""""""""
" disable to print FX on insert mode
""""""""""""""""""""""""""""""""""""
map! <F5> <Nop>
map! <F2> <Nop>
map! <F3> <Nop>
map! <F12> <Nop>
map! <F11> <Nop>
map! <F10> <Nop>
map! <F9> <Nop>
map! <F8> <Nop>
map! <F7> <Nop>
map! <F6> <Nop>
map! <F4> <Nop>
"color syntaxe available
syntax on                   " syntax highlighting
" speed up vim with limit syntaxe line number (really important)
 augroup vimrc

   autocmd!

   autocmd BufWinEnter,Syntax * syn sync minlines=500 maxlines=500

 augroup END
""""""""""""""""""""""""
filetype on                 " try to detect filetypes
filetype plugin indent on   " enable loading indent file for filetype
