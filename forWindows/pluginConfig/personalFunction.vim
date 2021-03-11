
"replace word under cursor in all git base
"function GitGrepReplace(word)
"let l:WordValue = expand("<cword>")
"execute "Ggrep <cword>"
"execute "cw"
":cdo %s/WordValue/word/gc
":cfdo %s/<search term>/<replace term>/gc 'search in all file'
""3. (If you want to save the changes in all files) :cdo update
"endfunction
"command! -nargs=1 GitGrepReplace  call GitGrepReplace('<args>')
"command! -nargs=1 WMB call WipeMatchingBuffers('<args>')




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function to allow to quit all secondary window.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"function! CloseAll()
"silent! :CocCommand explorer --quit
""silent! :CocCommand explorer --quit
"silent! pclose "close preview YCM
"silent! ccl "close result ggrep
"silent! helpclose "close help
"silent! call Close_gstatus() "close gstatu
"silent! call MyCloseDiff() "close git diff
"call DeleteBufferByExtension(".git") "close git windows
"call Close_gina() "don t work
"silent! :CocCommand explorer --quit
"CloseAll
"endfunction


"pip install cmake_format to launch for this command
function! CmakeFormat()
  execute "!cmake-format.exe -i " bufname("%")
endfunction
com! CmakeFormat silent! call CmakeFormat()<cr>


"function! PythonFormat()
  "execute "black " bufname("%")
"endfunction
"com! PythonFormat silent! call PythonFormat()<cr>

:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78




  "let g:saved_winnr_previous =0
let g:history_win_id = []
function History_cursor_window()
  echomsg("history_cursor_window")
  "echomsg(g:saved_winnr_previous)
  let saved_winnr = win_getid()
    "echom(g:saved_winnr_previous)
  "if saved_winnr != g:saved_winnr_previous 
    "let g:saved_winnr_previous = saved_winnr
    "echom("saved_winnr")
    "echom(saved_winnr)
    "echom("saved_winnr_prev")
    "echom(g:saved_winnr_previous)
    call add(g:history_win_id,saved_winnr)
  "endif
    "let history_win_reverse = g:history_win_id
    "call reverse(history_win_reverse)
    "call len(history_win_id)
    let indice = 0
  for elem in g:history_win_id
    let indice += 1 
    "echom(indice)
      "echo(win_id2win(elem))
      echom("indoce")
      echom(indice)
    if win_id2win(g:history_win_id[-indice]) != 0 
      echo("g:history_win_id[-indice]")
      echo(g:history_win_id[-indice])
      "echom(elem)
      let toto = g:history_win_id[-indice]
      echom("toto")
      echom(toto)
      return toto
    endif
  endfor
endfunction


function Close_all()
  let nodelete = 0
  let list_file_to_delete= []
  let list_file_to_keep = ['.vimrc','vimrcWindows' ]
  if expand('%:e') !=# ''
    let nodelete = 1
  endif
  for word in list_file_to_delete
    if expand('%:e') ==# word || expand('%:t') ==# word
      let  nodelete = 0
      break
    endif
  endfor

  for word in list_file_to_keep
    if expand('%:e') ==# word || expand('%:t') ==# word
      let  nodelete = 1
      break
    endif
  endfor

  if nodelete !=# 1
    execute "bw"
  endif
endfunction

function! CloseWindo()
  "echomsg("closewindo")
  "let saved_winnr = winnr()
  "let saved_winnr = bufname()
  let saved_winnr = win_getid()
  "echom saved_winnr
  pclose
  helpclose
  ccl
  silent! :FloatermHide!<cr>
  "silent! :CocCommand explorer --quit 
  
  "cache le terminal
  if has('nvim')
    if win_gotoid(g:term_win)
      hide
    endif
  endif
  windo call Close_all()
  "exec "silent! saved_winnr . 'wincmd w'"
  "exec "silent! saved_winnr . 'bufload'"
  "exec "silent! saved_winnr . 'win_gotoid'"
  "let saved_winnr = History_cursor_window()
  "echom("saved_winnr")
  "echom(saved_winnr)
  "echo saved_winnr
  call win_gotoid(saved_winnr)
endfunction

command! CloseAll call CloseWindo()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function for fold preprocessor directive in c/c++
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Foldpreprocessor()
  set foldtext=myfoldtext()
  set foldmarker=#if,#endif
  set foldmethod=marker
endfunction
function! UnFoldpreprocessor()
  set foldmethod=syntax
endfunction
" This function customises what is displayed on the folded line:
function! MyFoldText()
  let line = getline(v:foldstart)
  let linecount = v:foldend + 1 - v:foldstart
  let plural = ""
  if linecount != 1
    let plural = "s"
  endif
  let foldtext = printf(" +%s %d line%s: %s", v:folddashes, linecount, plural, line)
  return foldtext
endfunction
com! Foldpreprocessor silent! call Foldpreprocessor()<cr>
com! UnFoldpreprocessor silent! call UnFoldpreprocessor()<cr>
" This is the line that works the magic
"
"
"""""""""""""""""""""
" compile quickli a main cpp code
"""""""""""""""""""""
function ExecuteCpp()
  :!g++ -ggdb -o  %:r.outexe % -std=c++17
  :!%:r.outexe
endfunction
com! ExecuteCpp call ExecuteCpp()

function CExecute()
  :!gcc -ggdb -o  %:r.outexe % 
  :!%:r.outexe
endfunction
com! CExecute call CExecute()



function! GetBufferList()
  return filter(range(1,bufnr('$')), 'buflisted(v:val)')
endfunction

function! GetMatchingBuffers(pattern)
  return filter(GetBufferList(), 'bufname(v:val) =~ a:pattern')
endfunction

function! WipeMatchingBuffers(pattern)
  let l:matchList = GetMatchingBuffers(a:pattern)

  let l:count = len(l:matchList)
  if l:count < 1
    echo 'No buffers found matching pattern ' . a:pattern
    return
  endif

  if l:count == 1
    let l:suffix = ''
  else
    let l:suffix = 's'
  endif

  exec 'bw ' . join(l:matchList, ' ')

  echo 'Wiped ' . l:count . ' buffer' . l:suffix . '.'
endfunction

command! -nargs=1 WMB call WipeMatchingBuffers('<args>')

  """""""""""""""""""""""
  " vim benchmarck"""""
  " """"""""""""""""""""
function Profil_benchmark()
  :profile start profile.log
":profile func *
:profile file *
      
endfunction
command ProfilBenchmark call Profil_benchmark()


"""""""""""""""""""""""""""""""""""""""""""""""""""
"" toggle terminal
""""""""""""""""""""""""""""""""""""""""""""""""""""
  let g:term_buf = 0
  let g:term_win = 0
  function! Term_toggle(height)
    if win_gotoid(g:term_win)
      hide
    else
      botright new
      "vertical bo split new
      "vertical bo 80vsplit new
      "belowright new
      "exec "resize " . a:height
      try
        exec "buffer " . g:term_buf
      catch
        call termopen("pwsh", {"detach": 0})
        let g:term_buf = bufnr("")
      endtry
      startinsert!
      let g:term_win = win_getid()
    endif
  endfunction

