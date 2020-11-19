
map <C-a> GVgg
nnoremap <C-s> :w<cr>
inoremap <C-s> <c-o>:w<cr>
"noremap <leader>h :history<cr>
nmap q: <Nop>
map <C-c> y
"imap <C-h> :%s/
nmap <C-h> :%s/
vmap <C-h> :s/
" vnoremap <C-h> "hy:%s/<C-r>h//gc<left><left><left>map <C-f> /
"Allow to shearch visula selection with *

vnoremap * y/\V<C-r>=escape(@",'/\')<CR><CR>
"subsitute word under cursor
"nnoremap <leader>hh :%s/<c-r><c-w>/<c-r><c-w>/gc<c-f>$F/i "use command mode
"but need to debug this mode
nnoremap <leader>hh :%s/<c-r><c-w>/<c-r><c-w>/g
" Smart way to move between windows
map <C-S-Left> <C-W>h
map <C-S-Right> <C-W>l
map <C-S-Up> <C-W>k
map <C-S-Down> <C-W>j

map <leader>cd :cd %:p:h<cr>:pwd<cr>
map <leader>cg :Gcd<cr>



""""""""""""""""""""""""""""
" Add fr and en dictionary
""""""""""""""""""""""""""""

map <silent> <F7> "<Esc>:silent setlocal spell! spelllang=en<CR>"
map <silent> <F6> "<Esc>:silent setlocal spell! spelllang=fr<CR>"


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

"black hole register by default for d keyword
nnoremap dd "_dd
nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
vnoremap D "_D

nnoremap x "_x
vnoremap x "_x

"c use register by default
nnoremap cc dd
nnoremap c d
vnoremap c d

"use black hole for suppr key map
noremap <Del> "_x

"grep word under cursor
"nnoremap K :Ggrep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap K  :Gina grep --opener="to split" --group="test" -ie "\b<C-R><C-W>\b"

" Keymapping for grep word under cursor with interactive mode
"nnoremap <silent> K :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>

"Clear highlight on pressing ESC
nnoremap <esc> :noh<return><esc>
"map terminal
tnoremap <C-k> <UP>
tnoremap <C-j> <DOWN>
tnoremap <C-h> <LEFT>
tnoremap <C-l> <RIGHT>

"noremap  <silent>  q :call CloseAll()<cr>
"
nnoremap <silent> <F12>  :silent! call CmakeFormat()<cr>


noremap <silent> q <esc>:CloseAll<cr><esc>
noremap <silent> ² <esc>:CloseAll<cr><esc>
vm <silent> ² <esc>:CloseAll<cr><esc>
im <silent> ² <esc>:CloseAll<cr><esc>
tmap <silent>²  <C-\><C-n>:CloseAll<cr>

"" Find symbol of current document.
nnoremap <silent> <space>no  :<C-u>CocList -A --tab outline<cr>
"" Search workspace symbols.
nnoremap <silent> <space>nt  :<C-u>CocList -I symbols<cr>
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> <space>nh <Plug>(coc-diagnostic-prev)
nmap <silent> <space>nl <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> <space>nd <Plug>(coc-definition)
nmap <silent> <space>ny <Plug>(coc-type-definition)
nmap <silent> <space>ni <Plug>(coc-implementation)
nmap <silent> <space>nr <Plug>(coc-references)
nmap <silent> <space>nz <Plug>(coc-declaration)

nmap <silent> <space>nsd :call CocAction('jumpDefinition', 'split') <cr>
nmap <silent> <space>nsz :call CocAction('jumpDeclaration', 'split') <cr>
nmap <silent> <space>nvd :call CocAction('jumpDefinition', 'vsplit') <cr>
nmap <silent> <space>nvz :call CocAction('jumpDeclaration', 'vsplit') <cr>
nmap <silent> <space>nsz <Plug>(coc-declaration)
nmap <silent> <space>np <Plug>(coc-codeaction)
vmap <silent> <space>np <Plug>(coc-codeaction-selected)
" Symbol renaming.
nmap <leader>na <Plug>(coc-rename)
nmap <leader>n* <Plug>(coc-refactor)
nmap <leader>nf  <Plug>(coc-format)
" Apply AutoFix to problem on the current line.
nmap <leader>nq  <Plug>(coc-fix-current)
" Use K to show documentation in preview window.
nnoremap <silent> <space>nk :call <SID>show_documentation()<CR>


" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<Tab>"



inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction



" Use <C-l> for trigger snippet expand.
"imap <C-k> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
"vmap <C-j> <Plug>(coc-snippets-select)

"""""""""""""""""""""""""""""""""""""""""""""
"coc-completion
"""""""""""""""""""""""""""""""""""""""""""""
"Use <Tab> and <S-Tab> to navigate the completion list:

"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<Tab>"
"Use <cr> to confirm completion

"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"Note: you have to remap <cr> to make sure it confirm completion when pum is visible.

"Note: \<C-g>u is used to break undo level.

"To make <cr> select the first completion item and confirm the completion when no item has been selected:

"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
"To make coc.nvim format your code on <cr>, use keymap:

"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"Close the preview window when completion is done. bug in buffer commandline
"with ctrl-F. to disable in this
"autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

"""""""""""""""""""""""""""""""""""""""""""
" coc-explorer
""""""""""""""""""""""""""""""""""""""""""""
:nmap <space>ee :CocCommand explorer --toggle --sources=file+,   --quit-on-open  <CR>
:nmap <space>eb :CocCommand explorer --toggle --sources=buffer+, --quit-on-open<CR>
:nmap <space>em :CocCommand explorer --toggle --sources=bookmark+,  --quit-on-open<CR>

""""""""""""""""""""""""""""""""""""""""""""
" MAGIT
""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>m :Magit<cr>

"""""""""""""""""""""""""""""""""""""""""""
" vim-which-key
""""""""""""""""""""""""""""""""""""""""""

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
let g:which_key_map =  {}
let g:which_key_map.b = { 'name' : '+bookmark' }
let g:which_key_map.c = { 'name' : '+nerdcommenter' }
let g:which_key_map.f = { 'name' : '+file_search' }
let g:which_key_map.g = { 'name' : '+gina' }
let g:which_key_map.i = { 'name' : '+indent_guide' }
let g:which_key_map.b = { 'name' : '+todolist' }
let g:which_key_map.n = { 'name' : '+coc' }
let g:which_key_map.p = { 'name' : '+git_principal' }
let g:which_key_map.t = { 'name' : '+translate' }
let g:which_key_map.w = { 'name' : '+windows_focus' }
let g:which_key_map.z = { 'name' : '+grammarous' }
let g:which_key_map.SPC = { 'name' : '+easymotion' }
let g:which_key_map.l = { 'name' : '+todolist' }
let g:which_key_map.h = { 'name' : '+vim-command' }
call which_key#register(' ', "g:which_key_map")

"nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
"vnoremap <silent> <leader> :WhichKey '<Space>'<CR>
"set timeoutlen=1000
"

""""""""""""""""""""""""""""""""""""""""""""
" coc-todolist
""""""""""""""""""""""""""""""""""""""""""""
":nmap <space>ll :CocList -A --tab todolist<cr> "preview dont work well
:nmap <space>ll :CocList --tab todolist<cr>
:nmap <space>lc :CocCommand todolist.create<cr>


"map <A-j> <Plug>(easymotion-j)
"map <A-k> <Plug>(easymotion-k)
map <leader><leader>l <Plug>(easymotion-w)
map <leader><leader>h <Plug>(easymotion-b)
""map <A-S-J> <Plug>(easymotion-J)
""map <A-S-K> <Plug>(easymotion-K)
map <leader><leader>L <Plug>(easymotion-W)
map <leader><leader>H <Plug>(easymotion-B)
map e <Plug>(easymotion-s)
"map <A-j> <Plug>(easymotion-j)
"map <A-k> <Plug>(easymotion-k)
"map <A-l> <Plug>(easymotion-w)
"map <A-h> <Plug>(easymotion-b)
"map <A-S-J> <Plug>(easymotion-J)
"map <A-S-K> <Plug>(easymotion-K)
"map <leader><leader>L <Plug>(easymotion-W)
"map <leader><leader>H <Plug>(easymotion-B)



" Echo translation in the cmdline
nmap <silent> <Leader>te <Plug>Translate
vmap <silent> <Leader>te <Plug>TranslateV
" Display translation in a window
nmap <silent> <Leader>tt <Plug>TranslateW
vmap <silent> <Leader>tt <Plug>TranslateWV
" Replace the text with translation
nmap <silent> <Leader>tr <Plug>TranslateR
vmap <silent> <Leader>tr <Plug>TranslateRV
" Translate the text in clipboard
nmap <silent> <Leader>tx <Plug>TranslateX

" Echo translation in the cmdline
nmap <silent> <Leader>te! <Plug>Translate!
vmap <silent> <Leader>te! <Plug>TranslateV!
" Display translation in a window
nmap <silent> <Leader>tt! <Plug>TranslateW!
vmap <silent> <Leader>tt! <Plug>TranslateWV!
" Replace the text with translation
nmap <silent> <Leader>tr! <Plug>TranslateR!
vmap <silent> <Leader>tr! <Plug>TranslateRV!
" Translate the text in clipboard
nmap <silent> <Leader>tx! <Plug>TranslateX!



""""""""""""""""""""""""""""""""""""""""""""""""
" coc-bookmark"" to use when debugged
""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>bl <Plug>(coc-bookmark-next)
nmap <Leader>bh <Plug>(coc-bookmark-prev)
nmap <leader>bt <plug>(coc-bookmark-toggle)
nmap <leader>ba <plug>(coc-bookmark-annotate)
nmap <leader>bz :CocList -A --tab bookmark<cr>


"""""""""""""""""""""""""""""""""""""""""""""""
" vim-bookmark"
"""""""""""""""""""""""""""""""""""""""""""""""
"nmap <Leader>bi <Plug>BookmarkAnnotate
"nmap <Leader>ba <Plug>BookmarkShowAll
"nmap <Leader>bj <Plug>BookmarkNext
"nmap <Leader>bk <Plug>BookmarkPrev
"nmap <Leader>bc <Plug>BookmarkClear
"nmap <Leader>bx <Plug>BookmarkClearAll
"nmap <Leader>bkk <Plug>BookmarkMoveUp
"nmap <Leader>bjj <Plug>BookmarkMoveDown
"nmap <Leader>bg <Plug>BookmarkMoveToLine
"nmap <Leader>bt <Plug>BookmarkToggle

"""""""""""""""""""""""""""""""""""""""""""""""
" coc-list" replace fzf
"""""""""""""""""""""""""""""""""""""""""""""""
"nmap <leader>fb :CocList  buffers<cr>
"nmap <leader>fb :Buffer<cr>
nmap <leader>fb :CocList --number-select mru -A <cr>
nmap <leader>fg :CocList  gfiles<cr>
nmap <C-:> :CocList cmdhistory<cr>

"""""""""""""""""""""""""""""""""""""""""""""""
" grammarous"
"""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>ze :GrammarousCheck --lang=en --no-move-to-first-error<cr>
nmap <silent> <leader>zz :GrammarousCheck --lang=fr --no-move-to-first-error<cr>
nmap <silent> <leader>zr :GrammarousReset<cr>
nmap <silent> <leader>zi<Plug>(grammarous-move-to-info-window)  Move the cursor to the info window
nmap <silent> <leader>zo<Plug>(grammarous-open-info-window) Open the info window for the error under the cursor
nmap <silent> <leader>zr <Plug>(grammarous-reset) Reset the current check
nmap <silent> <leader>zf <Plug>(grammarous-fixit) Fix the error under the cursor automatically
nmap <silent> <leader>za <Plug>(grammarous-fixall)  Fix all the errors in a current buffer automatically
nmap <silent> <leader>zc <Plug>(grammarous-close-info-window) Close the information window from checked buffer
nmap <silent> <leader>zqq <Plug>(grammarous-remove-error) Remove the error under the cursor
nmap <silent> <leader>zdd <Plug>(grammarous-disable-rule) Disable the grammar rule under the cursor
nmap <silent> <leader>zl <Plug>(grammarous-move-to-next-error)  Move cursor to the next error
nmap <silent> <leader>zh <Plug>(grammarous-move-to-previous-error)



"nmap <silent> <leader>zt gram
"
""""""""""""""""""""""""""""""""""
"GINA
"""""""""""""""""""""""""""""""""""
nnoremap <leader>pc :Gina commit --opener="to split" --group="test"<cr>
nnoremap <leader>pe :Gcommit %<cr>
nnoremap <leader>ps :Gina status --opener="to split" --group="test"<cr>
nnoremap <leader>pb :Gina branch --opener=vsplit --group="test"<cr>
nnoremap <leader>pg :Gina grep --opener=tabnew --group="test" -ie
nnoremap <leader>pt :Gina tag --opener=vsplit  --group="test"<cr>



	nnoremap <silent> <leader>ga :Gina add %:p<CR>
	nnoremap <silent> <leader>gd :Gina compare<CR>
	nnoremap <silent> <leader>gc :Gina commit<CR>
	nnoremap <silent> <leader>gb :Gina blame --width=40<CR>
	nnoremap <silent> <leader>gs :Gina status -s<CR>
	nnoremap <silent> <leader>gl :Gina log --graph --all<CR>
	nnoremap <silent> <leader>gF :Gina! fetch<CR>
	nnoremap <silent> <leader>gp :Gina! push<CR>
	nnoremap <silent> <leader>go :,Gina browse :<CR>
	vnoremap <silent> <leader>go :Gina browse :<CR>



""""""""""""""""""""""""""""""""""
"coc-git
"""""""""""""""""""""""""""""""""""
nnoremap <leader>pp :CocCommand git.push<cr>

"""""""""""""""""""""""""""""""""""""
"coc-clang
""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>a :CocCommand clangd.switchSourceHeader<cr>


"""""""""""
" surround with "
"""""""""""
noremap <leader>" ciw""<Esc>P

"noremap : :<C-f>
"
noremap <leader>$ :colorscheme  solarized8<cr>


"""""""""""""""""""""
noremap <leader>ww :tabclose<cr>
noremap <leader>wx :only<cr>
noremap <leader>wq :q<cr>
nnoremap <leader>wv <c-v>
""""""""""""""""""""""

"quick  tab navigation (alt-f)
nnoremap <A-&> 1gt
nnoremap <A-é> 2gt
nnoremap <A-"> 3gt
nnoremap <A-'> 4gt
nnoremap <A-(> 5gt
nnoremap <A--> 6gt
nnoremap <A-è> 7gt
nnoremap <A-_> 8gt
nnoremap <A-ç> 9gt
nnoremap <A-à> 10gt

tnoremap <A-&> <C-\><C-n>1gt
tnoremap <A-é> <C-\><C-n>2gt
tnoremap <A-"> <C-\><C-n>3gt
tnoremap <A-'> <C-\><C-n>4gt
tnoremap <A-(> <C-\><C-n>5gt
tnoremap <A--> <C-\><C-n>6gt
tnoremap <A-è> <C-\><C-n>7gt
tnoremap <A-_> <C-\><C-n>8gt
tnoremap <A-ç> <C-\><C-n>9gt
tnoremap <A-à> <C-\><C-n>10gt


"enable copy paste with ctrl
if has("clipboard")
    " CTRL-X and SHIFT-Del are Cut
    vnoremap <C-X> "+x
    vnoremap <S-Del> "+x

    " CTRL-C and CTRL-Insert are Copy
    vnoremap <C-C> "+y
    vnoremap <C-Insert> "+y

    " CTRL-V and SHIFT-Insert are Paste
    map <C-V>		"+gP
    map <S-Insert>		"+gP

    cmap <C-V>		<C-R>+
    cmap <S-Insert>		<C-R>+


   tmap <C-V>		<C-\><C-n>"+gP
   tmap <S-Insert>		<C-\><C-n>"+gP

endif
