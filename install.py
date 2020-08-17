import os
from os.path import expanduser
def install_vim():
    local_path = os.path.abspath(os.path.dirname(__file__))
    print("install  .vimrc")
    f = open(os.path.join(expanduser("~") , ".vimrc"),"w")
    f.write("source " + os.path.join(local_path , "forWindows/vimrcWindows \n"))
    f.write("nnoremap <leader>v :e " + os.path.join(local_path , "forWindows/vimrcWindows") +"<cr> \n")
    f.write("let g:coc_config_home= \"" + os.path.join(local_path , "forWindows")+"\" \n")
    f.close()
    print("process finish")

def main():
    install_vim()

main()
