
"""""""""""""""""""""""""""""""""""
" lightline setting
"""""""""""""""""""""""""""""""""""

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \   'active': {
      \     'left':[ [ 'mode', 'paste' ],
      "\              [ 'gitbranch', 'cocstatus','readonly', 'LightlineFilename', 'modified' ]
      \              [ 'gitbranch', 'cocstatus','readonly', 'absolutepath', 'modified' ]
      \     ]
      \   },
      \   'component_function': {
      \     'gitbranch': 'fugitive#head',
      "\   'filename': 'CompleteRelativePath',
      \   'filename': 'LightlineFilename',
      \ }
      \ }
let g:lightline.separator = {
      \   'left': '|', 'right': '|'
      \}
let g:lightline.subseparator = {
      \   'left': '|', 'right': '|'
      \}

let g:lightline.tabline = {
      \   'left': [ ['tabs'] ],
      \   'right': [ ['close'] ]
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

func! CompleteRelativePath()
"return system("git ls-files","%")
"return execute("Git ls-files %")
endfu
"func! CompleteRelativePath()
  "let p = expand('%:p:h')
  "let rp = system("realpath --relative-to=".p." /my/project/directory")
  "call fzf#vim#complete#path("cd ".p." && find ".rp." -path '*/\.*' -prune -o -print \| sed '1d;s:^..::'")
  "return ""
"endfu
"function! LightlineFilename()
  "let root = fnamemodify(get(b:, 'git_dir'), ':h')
  "let path = expand('%:p')
  "if path[:len(root)-1] ==# root
    "return path[len(root)+1:]
  "endif
  "return expand('%')
  ""return "toto"
"endfunction
" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
