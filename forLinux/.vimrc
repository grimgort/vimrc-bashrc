set nocompatible            " be iMproved, required
filetype off                " required, so vundle will be loaded properly

let g:mapleader = ","

set rtp+=~/vimDebugPlugin
set rtp+=~/vimOther
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/vimDebugPlugin')
"Plug 'VundleVim/Vundle.vim'
"Plug 'vim-scripts/Conque-GDB' " debuguer for GDB
Plug 'scrooloose/nerdtree' "nerdTree = file explorer
Plug 'tpope/vim-fugitive' "fugitive =  git wrapper
Plug 'gregsexton/gitv', {'on': ['Gitv']} "top git log
Plug 'altercation/vim-colors-solarized' " solarized color for vim
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'kien/ctrlp.vim' "replaced by fzf
"Plug 'jlanzarotta/bufexplorer'
" youcompleme
" Plug 'humiaozuzu/TabBar'
Plug 'majutsushi/tagbar' "display a menu with tag in file
"Plug 'vim-scripts/Gundo' "Gundo.vim is Vim plugin to visualize your Vim undo tree
Plug 'mbbill/undotree' "show vim history
Plug 'Konfekt/FastFold' "empeche les lag avec syntaxe fold method
"Plug 'Shougo/echodoc' "Displays function signatures from completions in the command line
Plug 'Chiel92/vim-autoformat' "autoformat
Plug 'vim-latex/vim-latex' " plugin latex
"Plug 'ervandew/supertab' "allow autocompletion with tab key (replaced by
Plug 'Valloric/YouCompleteMe', { 'do': './install.py  --clangd-completer --clang-completer --clang-tidy'  } " YouCompleteMe is a fast, as-you-type, fuzzy-search code completion engine for Vim. command ofr install : python install.py. alternative from omnicompletion + jedi-vim(for pyhton file)
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
"Plug 'justmao945/vim-clang'
"Plug 'Rip-Rip/clang_complete'
Plug 'vim-airline/vim-airline' "light bar. slow severly conque GDB!!!!
Plug 'vim-airline/vim-airline-themes'
Plug 'alvan/vim-closetag' "close html tag with key '>' or '>>'
"Plug 'idanarye/vim-vebugger' "include somes debugguer for vim (better as conqueGDB?)
"Plug 'Shougo/vimproc.vim', {'do' : 'make'} "prerequi fo vebugger
"Plug 'ludovicchabant/vim-gutentags' "auto tag git project
Plug 'tell-k/vim-autopep8' "allow  command autopep8 in vim for python file
" Plug 'xolox/vim-easytags'
" Plug 'xolox/vim-misc' "prerequis for easytag
"Plug 'sjl/splice.vim' "tool for resolve threeMerge conflict
"Plug 'sirver/ultisnips' "UltiSnips is the ultimate solution for snippets in Vim
"Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter' "allow comment <leader>cc for comment
" Plug 'tpope/vim-commentary' "allow commentary gcc command
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'kablamo/vim-git-log' "allowGitLog

"Plug 'samoshkin/vim-mergetool'
Plug 'Raimondi/delimitMate'
"Plug 'Shougo/deoplete.nvim'
"Plug 'w0rp/ale'
Plug 'rchicoli/vim-zoomwin' "zoom with ctl-w-o
Plug 'ericcurtin/CurtineIncSw.vim' "switch between .h .c
Plug 'airblade/vim-gitgutter' 

call plug#end()



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

syntax on                   " syntax highlighting
filetype on                 " try to detect filetypes
filetype plugin indent on   " enable loading indent file for filetype

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" automatically leave insert mode after 'updatetime' milliseconds of inaction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup Foo
  au CursorHoldI * stopinsert"
  " set 'updatetime' to 15 seconds when in insert mode
  au InsertEnter * let updaterestore=&updatetime | set updatetime=15000
  au InsertLeave * let &updatetime=updaterestore
augroup END
autocmd! Foo
"-----------------
"" Plugin DEOPLETE
"-----------------
"let g:deoplete#enable_at_startup = 1
"-----------------
"" Plugin Curtline
"-----------------
noremap <leader>gh :call CurtineIncSw()<CR>
"
"-----------------
"" Plugin Autoformat
"-----------------
"au BufWrite * :Autoformat "autoformat on save
"noremap <F12> :Autoformat<CR>
"autocmd FileType f,tex let b:autoformat_autoindent=0
"-----------------
"" Plugin FZF
"-----------------
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
"-----------------
"" Plugin gutentag
"-----------------
"let g:gutentags_exclude_filetypes = "cxx,hxx"

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
map <leader>j :GFiles<cr>
map <c-b> :Buffers<cr>

"-----------------
"" Plugin ALE
"-----------------
"let g:ale_completion_enabled = 1
" let g:ale_linters = {
" \   'rust': ['rls', 'cargo']
" \}
" let g:ale_linters={'python': ['pylint', 'pydocstyle', 'mypy']}

"-----------------
"" Plugin fugitive
"-----------------
autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd QuickFixCmdPost *grep* cwindow "alow to choose file in quickFiXList whit :Ggrep command
" let g:EasyGrepOpenWindowOnMatch=0
command! GTuleapPush :Gpush --repo="https://codev-tuleap.intra.cea.fr/plugins/git/cathare/cathare3.git"

""""""""""""""""""""""
" Configure ctags for vim
""""""""""""""""""""""
"Auto chearsh the first tags file from the current file
set tags=./tags;,tags;



"""""""""""""""""""""""""""""""""""
" Splice setting
"""""""""""""""""""""""""""""""""""
" let g:splice_prefix = "<leader>t "

"""""""""""""""""""""""""""""""""""
" Vebugger setting
"""""""""""""""""""""""""""""""""""
let g:vebugger_leader=';'
let g:vebugger_path_gdb="/usr/bin/gdb"
"""""""""""""""""""""""""""""""""""
" Air-line Setting
"""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_theme='murmur'    " change theme of airline 'wombot'
" enable tabline
" let g:airline#extensions#tabline#enabled = 1
" set left separator
let g:airline#extensions#tabline#left_sep = ' '
" set left separator which are not editting
let g:airline#extensions#tabline#left_alt_sep = '|'
" show buffer number
let g:airline#extensions#tabline#buffer_nr_show = 1
"show servername to left airline
function! AirlineInit()
  let g:airline_section_b = airline#section#create(['%{v:servername}   ','hunks','branch'])
endfunction
autocmd VimEnter * call AirlineInit()


"-----------------
"" Plugin conquegdb
"-----------------
let g:ConqueGdb_Leader = '!'
" let g:ConqueGdb_SrcSplit = 'right'
let g:ConqueTerm_InsertOnEnter = 1
"can use <c-w>  in insert mode for switch buffer
" let g:ConqueTerm_CWInsert = 1
" let g:ConqueTerm_ReadUnfocused = 1
" let g:ConqueTerm_UnfocusedUpdateTime = 500
" let g:ConqueTerm_Color = 1
" let g:ConqueTerm_FastMode = 1
autocmd FileType conque_term autocmd! Foo CursorHoldI *

":colorscheme default

"""""""""""""""""""
"Rip-rip clang-completion
"""""""""""""""""""

"let g:clang_library_path='/usr/bin/clang'

"""""""""""""""""""
"clang-completion
"""""""""""""""""""
"let g:clang_format_auto = 1
"let g:clang_check_syntax_auto = 1
"let g:clang_verbose_pmenu = 1

"""""""""""""""""""
"YouCompleteMe
"""""""""""""""""""
"disable arrow key and use tab for selection
let g:ycm_key_list_select_completion = ['<TAB>']
let g:ycm_key_list_previous_completion = ['<S-TAB>']
let g:ycm_key_list_stop_completion = ['<C-y>', '<UP>', '<DOWN>']
"let g:ycm_clangd_binary_path = exepath('clangd')
"let g:loaded_youcompleteme = 1
"-----------------
" let g:ycm_log_level = 'debug'
" let g:ycm_show_diagnostics_ui = 0
"let g:enable_ycm_at_startup = 0
""""""" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")
let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_autoclose_preview_window_after_completion = 1

noremap <leader>gr :YcmCompleter GoToReferences <CR>
nnoremap <leader>gg :YcmCompleter GoTo<CR>
nnoremap <leader>ge :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR>
nnoremap <leader>gd :YcmCompleter GetDoc<CR>
nnoremap <leader>gf :YcmCompleter FixIt<CR>
nnoremap <F9> :YcmForceCompileAndDiagnostics<CR>
nnoremap <F12> :YcmCompleter Format<CR>

"-----------------
"" Plugin solarized
"-----------------
syntax enable
set background=dark
set guifont=Monospace\ Bold\ 16
colorscheme solarized


"-----------------
"" Plugin Ctrlp
"-----------------
" let g:ctrlp_working_path_mode = 'rc'
" let g:ctrlp_by_filename = 1
" let g:ctrlp_max_files = 0
" map <leader>j :CtrlP<cr>
" map <c-b> :CtrlPMRUFiles<cr>
" map <c-b> :CtrlPBuffer<cr>

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


"-----------------
"" Plugin NerdTree
"-----------------
let NERDChristmasTree=1
let NERDTreeWinSize=25
map <F2> :NERDTreeToggle<CR>
map <leader><F2> :NERDTreeFind<cr>

"
"
"-----------------
"" Plugin Tagbar
"-----------------
map <F3> :Tagbar<CR>
let g:tagbar_ctags_bin='ctags'
let g:tagbar_width=30


"-----------------
"" Plugin Gundo
"-----------------
"nnoremap <F4> :GundoToggle<CR>
" inoremap <F4> <c-o>:GundoToogle<cr>
"
"-----------------
"" Plugin UndotreeToggle
"-----------------
nnoremap <F4> :UndotreeToggle<CR>

"-----------------
"" Plugin Solarized
"-----------------
":colorscheme default
syntax enable
set background=dark
set guifont=Monospace\ Bold\ 16
colorscheme solarized

""""""""""""""""""""""""""""""
" commentary plugin
""""""""""""""""""""""""""""""
" map <C-d> gc <enter>
" imap <C-d> gc <enter>
"cathare syntax file
autocmd BufNewFile,BufRead *.dat set syntax=cathare3
"comment string on first ligne of cathare jdd
autocmd syntax cathare set commentstring=*%s
autocmd syntax cathare3 set commentstring=*%s
" autocmd syntax fortran set fortranComment=ls0:*





""-----------------
""" Plugin supertab
""-----------------
"let g:SuperTabDefaultCompletionType = "<c-n>"


"-----------------
"" Configure gvim
"-----------------
set guioptions-=T   " remove Tool bar
set guioptions-=r   " remove Right bar
set guioptions-=L   " remove Left bar
set guioptions=c
" you can copy with maj in insert modeuu
:set guioptions+=a keymodel=startsel,stopsel
"use system clipboard
set clipboard=unnamedplus
"correct cursor bug for gnome terminal
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
"Change cursor shape for GNU screen
if &term =~ "screen."
  let &t_ti.="\eP\e[1 q\e\\"
  let &t_SI.="\eP\e[5 q\e\\"
  let &t_EI.="\eP\e[1 q\e\\"
  let &t_te.="\eP\e[0 q\e\\"
else
  let &t_ti.="\<Esc>[1 q"
  let &t_SI.="\<Esc>[5 q"
  let &t_EI.="\<Esc>[1 q"
  let &t_te.="\<Esc>[0 q"
endif
"use classic editor shortcut
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set mouse=a
set nu
map <C-a> GVgg
map <F5> :w <cr>
inoremap <F5> <c-o>:w<cr>
noremap <leader>h :history<cr>
nmap q: <Nop>
map <C-c> y
map <C-h> :%s/
" vnoremap <C-h> "hy:%s/<C-r>h//gc<left><left><left>map <C-f> /
"Allow to shearch visula selection with *
vnoremap * y/\V<C-r>=escape(@",'/\')<CR><CR>
" Smart way to move between windows
map <C-S-Left> <C-W>h
map <C-S-Right> <C-W>l
map <C-S-Up> <C-W>k
map <C-S-Down> <C-W>j
"===============================
" Common Configuration for Vim
"================================
set encoding=utf-8      " utf-8 default  (others: big5, gbk, euc-jp)
set fencs=utf-8,big5    " fileencodings: utf-8 default (others:gbk,ucs-bom)
set showcmd
set noshowmode          " not show `Insert,Normal` at bottom left
set wildmenu
set number              " Show line number
set cursorline          " Show underline in current cursor
highlight CursorLine cterm=underline
set cursorcolumn        " Show highlight in current column
" set nowrap              " not wrap the long line
" set colorcolumn=80      " Display the limit of text width.
"set textwidth=79        " Restrict text width.
set mouse=a             " Enable mouse to use (all mode)
set scrolloff=2         " Keep space from top and bottom
set laststatus=2        " Alway show status bar at bottom
""" Tab setting
set tabstop=2           " Tab key indents X spaces at a time
set softtabstop=2       " makes the spaces feel like real tabs
set shiftwidth=2        " X spaces indents
set expandtab           " Use spaces when the <Tab> key is pressed"
""" Folding Setting
" set foldmethod=indent   " allow us fold on indent
set foldlevel=99        " don't fold by default.
""" Searching and Pattens
set hlsearch        " Highlight search by default.
set smarttab        " handle tab more intelligently.
set incsearch       " search pattern when still typing
set backspace=indent,eol,start
"set autochdir "move repository to current buffer
""""""""""""""""""""""""""""""""""
"history and backup functionality"
""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile
set undodir=/export/home/ftarroux/tmp/.vim/.undo//
set backupdir=/export/home/ftarroux/tmp/.vim/.backup//
set directory=/export/home/ftarroux/tmp/.vim/.swp//
set autoread

" Set 7 lines to the cursor - when moving vertically using j/k
set so=5
" No shearch sensitive case
set ignorecase
map <leader>cd :cd %:p:h<cr>:pwd<cr>


""""""""""""""""""""""
" enable fold methode
""""""""""""""""""""""
set foldmethod=syntax
"set foldmethod=indent
set foldenable
set foldlevel=99
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


""""""""""""""""""""""""""""
" Add fr and en dictionary
""""""""""""""""""""""""""""
setlocal spell spelllang=fr
map <silent> <F7> "<Esc>:silent setlocal spell! spelllang=en<CR>"
map <silent> <F6> "<Esc>:silent setlocal spell! spelllang=fr<CR>"
set nospell "disable spell on vim start (push F6 or F7 for enable)"
set keymodel-=stopsel


""""""""""""""""""""""""""
" Personal remap
"""""""""""""""""""""""""
map <c-w>è :resize 10<cr>
"nnoremap <TAB> >>
"nnoremap <S-TAB> <<
"vnoremap <TAB> >gv
"vnoremap <S-TAB> <gv
nnoremap << >>
nnoremap >> <<
vnoremap << >gv
vnoremap >> <gv


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function to allow to quit all secondary window.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CloseAll()
  silent! ccl
  silent! helpclose
  silent! call MyCloseDiff()
  call DeleteBufferByExtension(".git")
endfunction
noremap  <silent>  q :call CloseAll()<cr>

"function! MyCloseFugitive()
"if &filetype('#') !~ '^fugitive:' && bufname('%') =~ '^fugitive:'

function!  DeleteBufferByExtension(strExt)
  let s:bufNr = bufnr("$")
  while s:bufNr > 0
    if buflisted(s:bufNr)
      if (matchstr(bufname(s:bufNr), a:strExt) == a:strExt )
        if getbufvar(s:bufNr, '&modified') == 0
          execute "bd ".s:bufNr
        endif
      endif
    endif
    let s:bufNr = s:bufNr-1
  endwhile
endfunction

function! MyCloseDiff()
  if (&diff == 0 || getbufvar('#', '&diff') == 0)
        \ && (bufname('%') !~ '^fugitive:' && bufname('#') !~ '^fugitive:')
    echom "Not in diff view."
    return
  endif

  " close current buffer if alternate is not fugitive but current one is
  if bufname('#') !~ '^fugitive:' && bufname('%') =~ '^fugitive:'
    if bufwinnr("#") == -1
      b #
      bd #
      <C-W>k
      diffoff
      close
    else
      bd
    endif
  else
    bd #
    <C-W>k
    diffoff
    close
  endif
endfunction

"""
" Permet d'afficher la sortie shell
"""
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  let isfirst = 1
  let words = []
  for word in split(a:cmdline)
    if isfirst
      let isfirst = 0  " don't change first word (shell command)
    else
      if word[0] =~ '\v[%#<]'
        let word = expand(word)
      endif
      let word = shellescape(word, 1)
    endif
    call add(words, word)
  endfor
  let expanded_cmdline = join(words)
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:  ' . a:cmdline)
  call setline(2, 'Expanded to:  ' . expanded_cmdline)
  call append(line('$'), substitute(getline(2), '.', '=', 'g'))
  silent execute '$read !'. expanded_cmdline
  1
endfunction



