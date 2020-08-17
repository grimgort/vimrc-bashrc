import os
def install_vim():
    local_path = os.path.dirname(__file__)
    f = open(".vimrc2","w")
    f.write("source " + os.path.join(local_path , "forWindows/vimrcWindows"))
    f.write("nnoremap <leader>v :e " + os.path.join(local_path , "forWindows/vimrcWindows") +"<cr>")
    f.write("let g:coc_config_home= \"" + os.path.join(local_path , "forWindows")+"\"")
    f.close()
