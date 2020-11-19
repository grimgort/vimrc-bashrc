
" autocorrect text on insert leave
"augroup gram
  "au CursorHoldI * stopinsert"
  " set 'updatetime' to 15 seconds when in insert mode
  "au InsertEnter * let updaterestore=&updatetime | set updatetime=15000
  "au InsertLeave *  :GrammarousCheck --lang=fr --no-move-to-first-error<cr>
"augroup END
"
"let g:grammarous#use_vim_spelllang=1
"
""g:languagetool_port=8082
"let g:languagetool_server_command="java -cp ~/scoop/apps/languagetool/current/languagetool-server.jar org.languagetool.server.HTTPServer --port 8082"

"let g:languagetool = {
"'.' : {
"{model1} for all filetypes
"}
"}

"{model1} = {
""'enabledRules' : list of enabled rules,
""'disabledRules' : list of disabled rules,
""'enabledCategories' : list of enabled categories,
""'disabledCategories' : list of disabled categories,
"'language' : ['fr']
"}
"
"
