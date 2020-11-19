if has('nvim')
else
  packadd termdebug " add gdb to vim
  noremap <leader>,r :Run <cr>
  "run the program with args or the previous arguments
  noremap <leader>,a :Arguments<cr>
  "{args}  set arguments for the next :Run
  noremap <leader>,b :Break<cr>
  "set a breakpoint at the cursor position
  "Break {position} "    set a breakpoint at the specified position
  noremap <leader>,c :Clear <cr>
  " delete the breakpoint at the cursor position
  noremap <leader>,s :Step <cr>
  "  execute the gdb step command
  noremap <leader>,o :Over <cr>
  "execute the gdb next command (`:Next` is a Vim command)
  noremap <leader>,f :Finish <cr>
  "execute the gdb finish command
  noremap <leader>,c :Continue <cr>
  "execute the gdb ontinue command
  noremap <leader>,w :Stop <cr>
  "interrupt the program
  noremap <leader>,e :Evaluate<cr>
  vnoremap <leader>,e :'<,'>Evaluate<cr>

  "debug json matisse
  "
  "com! CmakeFormat silent! call CmakeFormat()<cr>
  function! Toto()
    "silent! :Run D:/ftarroux/Documents/FRED/baseGit/Otamat/BaseDeTest/aero_5_1/T350-VE-NA-5-1_1.scm D:/ftarroux/Documents/FRED/baseGit/Otamat/BaseDeTest/aero_5_1/matisse.cfg
    "silent! :Run D:/ftarroux/Documents/FRED/baseGit/Otamat/BaseDeTest/aero_5_10/T350-NR-NA-5-10_1.scm D:/ftarroux/Documents/FRED/baseGit/Otamat/BaseDeTest/aero_5_1/matisse.cfg
    :Termdebug D:/ftarroux/Documents/FRED/baseGit/JsonMatisse/matisseReaderCjson/matisse_fred2.exe
    "silent! :Run D:\ftarroux\Documents\FRED\BaseGit\Otamat\BaseDeTest\F01-TRANS-03\F01-TRANS-03.scm D:/ftarroux/Documents/FRED/baseGit/JsonMatisse/matisseReaderCjson/./matisse.cfg
  :Run
  D:\ftarroux\Documents\FRED\BaseGit\JsonMatisse\matisseReaderCjson\BaseDeTest\F02-AER-02-ITG\F02-AER-02-ITG.scm D:\ftarroux\Documents\FRED\BaseGit\JsonMatisse\matisseReaderCjson\BaseDeTest\F02-AER-02-ITG\matisse.cfg
endfunction
  silent com! RunMatisse call Toto()
endif

