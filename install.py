import os
from os.path import expanduser
import shutil

local_path = os.path.abspath(os.path.dirname(__file__))
def install_vim():
    print("install  .vimrc")
    f = open(os.path.join(expanduser("~") , ".vimrc"),"w")
    f.write("source " + os.path.join(local_path , "forWindows/vimrcWindows \n"))
    f.write("nnoremap <leader>v :e " + os.path.join(local_path , "forWindows/vimrcWindows") +"<cr> \n")
    f.write("let g:coc_config_home= \"" + os.path.join(local_path , "forWindows")+"\" \n")
    f.close()
    print("process finish")

def install_ginit():
    print("install ginit")
    shutil.copy2(os.path.join(local_path , "forWindows/ginit.vim"),os.path.join(expanduser("~") , "AppData/Local/nvim") )
    
def install_gitconfig():
    print("install gitconfig")
    shutil.copy2(os.path.join(local_path , "forWindows/.gitconfig"),expanduser("~") )

def main():
    install_vim()
    install_ginit()
    install_gitconfig()

main()
