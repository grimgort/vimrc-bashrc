import os
from os.path import expanduser
import shutil

local_path = os.path.abspath(os.path.dirname(__file__))

#recursively merge two folders including subfolders
def mergefolders(root_src_dir, root_dst_dir):
    for src_dir, dirs, files in os.walk(root_src_dir):
        dst_dir = src_dir.replace(root_src_dir, root_dst_dir, 1)
        if not os.path.exists(dst_dir):
            os.makedirs(dst_dir)
        for file_ in files:
            src_file = os.path.join(src_dir, file_)
            dst_file = os.path.join(dst_dir, file_)
            if os.path.exists(dst_file):
                os.remove(dst_file)
            shutil.copy(src_file, dst_dir)

def install_vim():
    print("install  .vimrc")
    f = open(os.path.join(expanduser("~") , ".vimrc"),"w")
    f.write("source " + os.path.join(local_path , "forWindows/vimrcWindows \n"))
    f.write("nnoremap <leader>v :e " + os.path.join(local_path , "forWindows/vimrcWindows") +"<cr> \n")
    path_string = str(os.path.join(local_path , "forWindows"))
    path_string = path_string.replace("\\","/")
    f.write("let g:coc_config_home= \"" + path_string +"\" \n")
    f.close()
    print("process finish")

def install_ginit():
    print("install ginit")
    shutil.copy2(os.path.join(local_path , "forWindows/ginit.vim"),os.path.join(expanduser("~") , "AppData/Local/nvim") )
    
def install_gitconfig():
    print("install gitconfig")
    shutil.copy2(os.path.join(local_path , "forWindows/.gitconfig"),expanduser("~") )

def install_powershell():
    print("install powershell")
    # if (os.path.exists(os.path.join(expanduser("~") , "Documents/WindowsPowerShell"))):
        # shutil.rmtree(os.path.join(expanduser("~") , "Documents/WindowsPowerShell"))
    # shutil.copytree(os.path.join(local_path , "forWindows/WindowsPowerShell"),os.path.join(expanduser("~") , "Documents/WindowsPowerShell"))
    mergefolders(os.path.join(local_path , "forWindows/WindowsPowerShell"),os.path.join(expanduser("~") , "Documents/WindowsPowerShell"))

def main():
    install_vim()
    install_ginit()
    install_gitconfig()
    install_powershell()

main()
