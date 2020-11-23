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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"color syntaxe available
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"syntax on                   " syntax highlighting
" speed up vim with limit syntaxe line number (really important)
augroup vimrc
   autocmd!
   autocmd BufWinEnter,Syntax * syn sync minlines=500 maxlines=500
augroup END
""""""""""""""""""""""""
filetype on                 " try to detect filetypes
filetype plugin indent on   " enable loading indent file for filetype

set showtabline=2  " Show tabline
"-----------------
"" Configure gvim
"-----------------
if has('nvim')
else
   set guioptions-=e  " Don't use GUI tabline
   set guioptions-=T   " remove Tool bar
   set guioptions-=r   " remove Right bar
   set guioptions-=L   " remove Left bar
   set guioptions=c
   "you can copy with maj in insert modeuu
   "cause big lag on visual mode (set guioption+=a
   ":set guioptions+=a keymodel=startsel,stopsel
   ":GuiFont! Consolas:h13:cANSI
   "set guifont=*:h13
   "set guifont=Source_Code_Pro:b:h13.5
   " you can copy with maj in insert modeuu
   " cause big lag on visual mode (set guioption+=a
   set guioptions+=a keymodel=startsel,stopsel
endif
"-----------------
"" Plugin solarized
"-----------------
"syntax enable
"set background=dark
"set guifont=Monospace\ Bold\ 16
colorscheme solarized8
"colorscheme gruvbox
let g:gruvbox_contrast_dark="soft"
""gui font must be set in ginit
"set guifont=Source_Code_Pro:h13
"au :GuiFont! Consolas:h14:cANSI
"set guifont=Consolas:h14:cANSI
set background=dark
"use system clipboard
set clipboard=unnamed
"use classic editor shortcut
set mouse=a

"===============================
" Common Configuration for Vim
"================================
set encoding=utf-8      " utf-8 default  (others: big5, gbk, euc-jp)
set fencs=utf-8 " fileencodings: utf-8 default (others:gbk,ucs-bom)
set showcmd
set noshowmode          " not show `Insert,Normal` at bottom left
set wildmenu
set number              " Show line number
set cursorline          " Show underline in current cursor
"highlight CursorLine cterm=underline gui=underline
set cursorcolumn        " Show highlight in current column
"red line to 80 column
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/"
set wrap              " not wrap the long line
set colorcolumn=81      " Display the limit of text width.
"au BufRead,BufNewFile CMakeLists.txt setlocal textwidth=80"
"set textwidth=80        " Restrict text width.
"set mouse=a             " Enable mouse to use (all mode)

set scrolloff=999         " Keep space from top and bottom. 999=center cursor vertically
" avoid buf on terminal
"au TermEnter * setlocal scrolloff=0
"au TermLeave * setlocal scrolloff=999

set laststatus=2        " Alway show status bar at bottom
""" Tab setting
"set smartindent
set tabstop=2           " Tab key indents X spaces at a time
set softtabstop=2       " makes the spaces feel like real tabs
set shiftwidth=2        " X spaces indents
set expandtab           " Use spaces when the <Tab> key is pressed"
""" Searching and Pattens
set hlsearch        " Highlight search by default.
set smarttab        " handle tab more intelligently.
set incsearch       " search pattern when still typing
set backspace=indent,eol,start
"size of commande line
set cmdheight=1
"set autochdir "move repository to current buffer
""""""""""""""""""""""""""""""""""
"history and backup functionality"
""""""""""""""""""""""""""""""""""
"set nobackup
"set nowb
"set noswapfile
"set backup
"set wb
set swapfile
set shortmess+=A " disable warniong message with swapfile
if !isdirectory($HOME . "/.vim/.backup")
   call mkdir($HOME . "/.vim/.backup", "p", 0700)
endif
if !isdirectory($HOME . "/.vim/.undo")
   call mkdir($HOME . "/.vim/.undo", "p", 0700)
endif
if !isdirectory($HOME . "/.vim/.swp")
   call mkdir($HOME . "/.vim/.swp", "p", 0700)
endif

set undofile
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

" No shearch sensitive case
set ignorecase


"""""""""""""""""""""""""""""""""""""""""""""""""""
"" toggle terminal
"""""""""""""""""""""""""""""""""""""""""""""""""""
if has('nvim')
   nnoremap <leader>à  :call Term_toggle(15)<cr>
   tnoremap <leader>à  <C-\><C-n>:call Term_toggle(15)<cr>
   nnoremap à  :call Term_toggle(15)<cr>
   tnoremap à  <C-\><C-n>:call Term_toggle(15)<cr>
   tmap <Esc> <C-\><C-n>
   tmap <C-w> <C-\><C-n><C-w>
   au BufEnter * if &buftype == 'terminal' | :startinsert | endif
   au BufEnter * if &buftype == 'terminal' | :set scrolloff=0 | endif
   au BufLeave * if &buftype == 'terminal' | :set scrolloff=999 | endif
   "au TermEnter * startinsert
else
   " map <C-@> to toggle
   tnoremap <silent>  <leader>à <C-w>:ToggleTerminal<CR>
   nnoremap <silent>  <leader>à :ToggleTerminal<CR>
   tnoremap <silent>  à <C-w>:ToggleTerminal<CR>
   nnoremap <silent>  à :ToggleTerminal<CR>
   " set your favorite shell
   let g:toggle_terminal#command = 'pwsh'
   "let g:toggle_terminal#command = 'powershell'
   " set terminal window position
   " (see possible options at :help vertical)
   let g:toggle_terminal#position = 'topleft'
endif
"
""""""""""""""""""""""
" enable fold methode
""""""""""""""""""""""
autocmd FileType jsonc set foldmethod=indent
set foldmethod=syntax
"set foldmethod=indent
set foldenable
set foldlevel=10
""enable fortran folding
let fortran_fold=1 " increase drastycely lag
let fortran_fold_conditionals=1
""fortran77 insert "&" on a new line column 6
let fortran_fixed_source=1
" let fortran_free_source=0
" let fortran_more_precise=1
let fortran_dialect="f77"
let fortran_have_tabs=1
" syn match fortranContinueMark display "^.\{5}\S"lc=5
"" unlet! fortran_free_source
"filetype plugin indent on
let fortran_do_enddo=1
"" add column to left for folder numero and git wrapper
set foldcolumn=2


""DOXYGEN syntaxe
let g:load_doxygen_syntax=1
autocmd FileType c,cpp,h set comments-=://
autocmd FileType c,cpp,h set comments+=:///<
autocmd FileType c,cpp,h set comments+=://
autocmd FileType c,cpp,h set comments+=://!<
"set comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,bO:///,O://,bO://!<
"
"
"
""""""""""""""""""""""""""""
" Add fr and en dictionary
""""""""""""""""""""""""""""
"setlocal spell spelllang=fr
"hi clear SpellBad "disable udernlined error for spell"
"hi clear SpellCap "disable udernlined error for spell"
"hi clear SpellRare "disable udernlined error for spell"
"hi clear SpellLocal "disable udernlined error for spell"

"hi SpellBad   cterm=underline ctermfg=9  ctermbg=0 gui=undercurl
"hi SpellCap   cterm=underline ctermfg=14 ctermbg=0 gui=undercurl
"hi SpellRare  cterm=underline ctermfg=13 ctermbg=0 gui=undercurl
"hi SpellLocal cterm=underline ctermfg=11 ctermbg=0 gui=undercurl

set nospell "disable spell on vim start (push F6 or F7 for enable)"
set keymodel-=stopsel
set dictionary=D:\ftarroux\Documents\FRED\baseGit\vimrc-bashrc\liste.de.mots.francais.frgut.txt





"show hidden char
autocmd FileType python set listchars=nbsp:☠,tab:▸␣
set list

"autocmd WinEnter * call History_cursor_window()
"autocmd CursorMoved * call History_cursor_window()
"
"
"
"""""""""""""""""""""""""""""""""""""
" coc-config-general
"""""""""""""""""""""""""""""""""""""
" reste en normal mode aprés une recherche fuzzy
autocmd WinEnter * "normal <Esc>"

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=500

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
"set signcolumn=yes

"for working with git gutter
if has('nvim')
   set signcolumn=yes:2
else
   set signcolumn=yes
endif

if has('nvim')
   "let g:python3_host_prog = "D:/ftarroux/Logiciel/Python38-32/python.exe"
   let g:python3_host_prog = "D:/ftarroux/Logiciel/python38/python.exe"
else
   "set pythondll=D:\ftarroux\Logiciel\Python2\python27.dll
   set pythonthreedll="D:/ftarroux/Logiciel/Python38-32/python38.dll"
endif
" ambience theme from terminator
if has('nvim')
   let g:terminal_color_0  = '#2e3436'
   let g:terminal_color_1  = '#cc0000'
   let g:terminal_color_2  = '#4e9a06'
   let g:terminal_color_3  = '#c4a000'
   let g:terminal_color_4  = '#3465a4'
   let g:terminal_color_5  = '#75507b'
   let g:terminal_color_6  = '#06989a'
   let g:terminal_color_7  = '#d3d7cf'
   let g:terminal_color_8  = '#555753'
   let g:terminal_color_9  = '#ef2929'
   let g:terminal_color_10 = '#8ae234'
   let g:terminal_color_11 = '#fce94f'
   let g:terminal_color_12 = '#729fcf'
   let g:terminal_color_13 = '#ad7fa8'
   let g:terminal_color_14 = '#34e2e2'
   let g:terminal_color_15 = '#eeeeec'
endif


set diffopt+=vertical  "set siff in vertical mode by default"

"""""""""""""""""""""
" autoread
""""""""""""""""""""
set autoread
if has('nvim')
   autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
   " notification after file change
   autocmd FileChangedShellPost *
            \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" automatically leave insert mode after 'updatetime' milliseconds of inaction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"augroup Foo
"au CursorHoldI * stopinsert"
"" set 'updatetime' to 15 seconds when in insert mode
"au InsertEnter * let updaterestore=&updatetime | set updatetime=15000
"au InsertLeave * let &updatetime=updaterestore
"augroup END
"autocmd! Foo

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" return on normal mode when vim lost focus
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd FocusLost * call feedkeys("\<esc>")

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set powershell by terminal default
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set shell=powershell  "create a bug on plug install !!! be careful
"set shellcmdflag=-command
"
"set shell=powershell.exe
"set shellcmdflag=-NoProfile\ -NoLogo\ -NonInteractive\ -Command
"set shellpipe=|
"set shellredir=>
"set shell=powershell.exe\ -NoLogo\ -NoProfile\ -NonInteractive\ -ExecutionPolicy\ RemoteSigned
" if shellcmdflag starts with '-' then tempname() uses forward slashes, see
" https://groups.google.com/forum/#!topic/vim_dev/vTR05EZyfE0
"set shellcmdflag=\ -Command
"set shellquote=
"set shellxquote=(
"let &shellpipe='| Out-File -Encoding UTF8 %s'
"let &shellredir='| Out-File -Encoding UTF8 %s'
"set noshellslash

"""""""""""""""""""""
" Autoclose old buffer
"""""""""""""""""""""
" function CloseLast ()
" python <<EOF
" import vim
" N = 10
" listed_buffers = [b for b in vim.buffers if b.options['buflisted'] and not b.options['modified']]
" for i in range (0, len (listed_buffers) - N):
"   vim.command (':bd' + str (listed_buffers[i].number))
" EOF
" endfunction
" autocmd BufNew * call CloseLast()

"""""""""""""""""""""""""""""""""""""""""""""""""
" fix bug terminal
"""""""""""""""""""""""""""""""""""""""""""""""""
"correct cursor bug for gnome terminal
"let &t_SI = "\<Esc>[6 q"
"let &t_SR = "\<Esc>[4 q"
"let &t_EI = "\<Esc>[2 q"
""Change cursor shape for GNU screen
"if &term =~ "screen."
"let &t_ti.="\eP\e[1 q\e\\"
"let &t_SI.="\eP\e[5 q\e\\"
"let &t_EI.="\eP\e[1 q\e\\"
"let &t_te.="\eP\e[0 q\e\\"
"else
"let &t_ti.="\<Esc>[1 q"
"let &t_SI.="\<Esc>[5 q"
"let &t_EI.="\<Esc>[1 q"
"let &t_te.="\<Esc>[0 q"
"endif
