

#if [[ $HOSTNAME != "is227550.intra.cea.fr" ]] ; then
  #ssh is227550 -X 
  #source ~/.bashrc
#fi


[ -z "$PS1" ] && return
#launch screen on TERM
# [[ $TERM == "xterm-256color" ]] && screen

#disable cinnamon-screesaver for avoid bug
# killall cinnamon-screensaver


# .bashrc
# Don't load this part on vim instance for avoid conflict.
# Vim will use alias in his shell with "shellcmdflag" option in vimrc
if [[ "$VIM" == "" ]]; then
  bashrc_sourced=$(stat -c %Y ~/.bashrc) ;
  echo "non vim environnement"

  [[ "$TERM" == "xterm-256color" ]] && screen
  # Source global definitions
  if [ -f /etc/bashrc ]; then
    . /etc/bashrc
  fi

  # shopt -s expand_aliases

  # Uncomment the following line if you don't like systemctl's auto-paging feature:
  # export SYSTEMD_PAGER=

  # User specific aliases and functions

  # --- for Cathare3 ---
  export TOOLBOX_MASTER="cathare3"
  export CATDEV_DIR="/home"
  . /home/cath23/_base_dev/toolbox/bin/install/init_project_env.sh toolbox svn cathare3
  #
  alias setCathare='. /home/cath23/_base_dev/toolbox/bin/install/init_project_env.sh toolbox svn cathare3'


  # alias gdb='LC_CTYPE=C.UTF-8 gdb'
  # ulimit -c unlimited
  # export LD_BIND_NOW=1
  # export LD_HWCAP_MASK=0

  export EDITOR=vim
  # configure EDITOR variable
  # export EDITOR=vim
  export SVN_EDITOR=vim
  # Give local directory for .cache (dont flood your home)
  # XDG_CACHE_HOME="/export/home/ftarroux/tmp/"

  # using tput commands for color prompt
  FGBLK=$( tput setaf 0 ) # 000000
  FGRED=$( tput setaf 1 ) # ff0000
  FGGRN=$( tput setaf 2 ) # 00ff00
  FGYLO=$( tput setaf 3 ) # ffff00
  FGBLU=$( tput setaf 4 ) # 0000ff
  FGMAG=$( tput setaf 5 ) # ff00ff
  FGCYN=$( tput setaf 6 ) # 00ffff
  FGWHT=$( tput setaf 7 ) # ffffff

  BGBLK=$( tput setab 0 ) # 000000
  BGRED=$( tput setab 1 ) # ff0000
  BGGRN=$( tput setab 2 ) # 00ff00
  BGYLO=$( tput setab 3 ) # ffff00
  BGBLU=$( tput setab 4 ) # 0000ff
  BGMAG=$( tput setab 5 ) # ff00ff
  BGCYN=$( tput setab 6 ) # 00ffff
  BGWHT=$( tput setab 7 ) # ffffff

  RESET=$( tput sgr0 )
  BOLDM=$( tput bold )
  UNDER=$( tput smul )
  REVRS=$( tput rev )

  # modification of the prompt:
  chemin='$(pwd|rev|cut -d"/" -f1-3|rev)'

  PROMPT_COMMAND='echo -ne "\033]0;$(pwd|rev|cut -d"/" -f1-3|rev)\007"'
  export PS1="\[$FGCYN\][\[$FGMAG\]\u\[$FGBLU\]@\[$FGGRN\]\h\[$FGYLO\](\t)\[$FGRED\]$chemin\[$FGCYN\]]\$\[$RESET\]"
  # PS1="\r\[$FGCYN\][\[$FGMAG\]\u\[$FGBLU\]@\[$FGGRN\]\h\[$FGYLO\]($GCONF_PROJECT)\[$FGRED\]$chemin\[$FGCYN\]]\$\[$RESET\]"
  # Add the following prior to the catch all (ie *)):

  # Blue = 34
  # Green = 32
  # Light Green = 1;32
  # Cyan = 36
  # Red = 31
  # Purple = 35
  # Brown = 33
  # Yellow = 1;33
  # white = 1;37
  # Light Grey = 0;37
  # Black = 30
  # Dark Grey= 1;30
  # The first number is the style (1=bold), followed by a semicolon, and then the actual number of the color, possible styles are:
  #
  # 0   = default colour
  # 1   = bold
  # 4   = underlined
  # 5   = flashing text
  # 7   = reverse field
  # 40  = black background
  # 41  = red background
  # 42  = green background
  # 43  = orange background
  # 44  = blue background
  # 45  = purple background
  # 46  = cyan background
  # 47  = grey background
  # 100 = dark grey background
  # 101 = light red background
  # 102 = light green background
  # 103 = yellow background
  # 104 = light blue background
  # 105 = light purple background
  # 106 = turquoise background
  # All possible colors:
  #
  # 31  = red
  # 32  = green
  # 33  = orange
  # 34  = blue
  # 35  = purple
  # 36  = cyan
  # 37  = grey
  # 90  = dark grey
  # 91  = light red
  # 92  = light green
  # 93  = yellow
  # 94  = light blue
  # 95  = light purple
  # 96  = turquoise

  #color file in consol
  LS_COLORS=$LS_COLORS:'*.dat=1;35:*.list=1;33:*g.dat=4;35:*.f=4;91' ; export LS_COLORS

  # required for ftnchek & eclipse
  # ulimit -s unlimited  # no limit for the stack size


fi
# --- for guithare ---
# alias guithare="/net/seoul/vol/DENdatabase/ssth_projets/cathare3/_base_dev/toolbox/guithare/guithare_Fedora18_64/run.csh"
# lib required for Fedora 20
export LD_LIBRARY_PATH="/export/home/LIBRARIES:$LD_LIBRARY_PATH:/home/cath23/_base_dev/prerequisites/eos/Fedora24_64/eos-1.5.2r/lib"

################################################################
############################ Truc perso! #######################
######################################################
##########
# repertoireScript="/export/home/ftarroux/svn_extract/DocumentationTMA/TMATools/ScriptFred"
repertoireScript="~/0_SCRIPT"
# Script Perso
# alias versfred="init_c3dev ; bash $repertoireScript/vers.sh"
# alias versC2="init_v25dev ; echo /export/home/ftarroux/svn_extract/v25dev | ns_instal.unix"
#alias clangd="~/vimDebugPlugin/YouCompleteMe/third_party/ycmd/third_party/clangd/output/bin/clangd"
alias frvers="bash $repertoireScript/vers.sh"
alias frversc2="echo /export/home/ftarroux/svn_extract/v25dev | ns_instal.unix"
alias frrechc3="bash $repertoireScript/rechercheC3"
# alias frrechc3cpp="bash $repertoireScript/rechercheC3cpp.unix"
alias frimplanterSource="bash $repertoireScript/implanterSource.sh"
alias frnetoyagePrint="bash $repertoireScript/netoyagePrint.sh"
alias frenleverSource="bash $repertoireScript/enleverSource.sh"
alias frrecupererSource="bash $repertoireScript/recuperersource.sh"
alias frcrerIssue="bash $repertoireScript/crer_repertoire.sh"
# alias frtcsTotal="bash $repertoireScript/tcsTotal.sh"
alias frconcatenationpdf="bash $repertoireScript/concatenationpdf.unix"
alias frlocalToolbox="source $repertoireScript/localToolbox.sh"
alias frgc3="bash $repertoireScript/gc3.sh"
alias frverspy="python $repertoireScript/buildPy.py"
alias frsources="python $repertoireScript/frsources.py"
alias frsourcesc2="python $repertoireScript/frsources.py -s /export/home/ftarroux/svn_extract/v25dev"

alias frcleansimulation="python $repertoireScript/frcleansimulation.py"
alias frglist="gvim <(tail -50000 listing)"
alias frsync="python $repertoireScript/frsync.py"

alias frbashcalculation="python $repertoireScript/frbashCalculation.py"
alias frclonaallbranch="bash $repertoireScript/frclonaallbranch"

alias frtuleap="python $repertoireScript/frtuleap.py"

export sc3="/export/home/ftarroux/svn_extract/c3dev/"
export sc2="/export/home/ftarroux/svn_extract/v25dev/"
export stool="/export/home/ftarroux/svn_extract/tools/"


# Racourcie chemin d'accé
alias frperso="cd /export/home/ftarroux/1_dev_perso_C3"
alias frsvn="cd /export/home/ftarroux/svn_extract"
alias frserveurC3="cd /home/cath23/_base_dev/c3dev"

# shortcut for look tcs failed on running ctest
alias frtestsfailed="_version/Testing/Temporary/LastTestsFailed.log"


# Racourci TCS serveur
# alias frsavebilanC3="google-chrome /home/cath23/_base_dev/c3dev/work_8_64.save/._bilan/tcs/tcs.html &"
alias frbilanC3="o /home/cath23/_base_dev/c3dev/work_Centos7_64/reports/TCSCathare3.html"
# alias frweekbilanC3="google-chrome /home/cath23/_base_dev/c3dev/work_Fedora18_64.week/._bilan/tcs/tcs.html &"



# Documentation CATHARE
repertoireDocC3="/home/cath23/_base_dev/c3dev/work_Centos7_64.weekend.validated/doc_c2c3"
alias frdicoc2="o /home/cath23/_base_dev/v25dev/work_Centos7_64.weekend.validated/doc_c2c3/*DICOCEA*.pdf &"
alias frpostproc2="o /home/cath23/_base_dev/v25dev/work_Centos7_64.weekend.validated/doc_c2c3/*POSTPRO*.pdf &"
alias frdico="o $repertoireDocC3/*DICOCEA*.pdf &"
alias frpostpro="o $repertoireDocC3/*POSTPRO*.pdf &"
alias frcomparetcshtmlweekendc3="o /home/cath23/_base_dev/c3dev/work_Fedora24_64.weekend.validated/reports/TCSCathare3.html"
alias frdiffjdd="bash ~/0_SCRIPT/frdiffjdd.sh "
# Racourcie application
vimIns="/export/home/ftarroux/Autre/logiciel/VimInst/bin/vim"
# alias k="kate"
# alias c="./cathar.unix"

alias frnamely="vim ~/Documents/Documentation/namely.txt"

function c() {
  frsources
  rm *.o
  ./cathar.unix "$@"
  # tail -50 listing
}
function t() {
  frverspy lol
  ./tradjdd.unix "$@"
}
# alias kw="kwrite $1 &"
alias o="exo-open"
alias p="./postpro.unix"
alias r="./read.unix"
# alias vim="/export/home/ftarroux/Autre/logiciel/VimInst/bin/vim"
# alias v="$vimIns"

# Toolbox alias
repertoireSource="/export/home/ftarroux/svn_extract/c3dev/"
repertoireInstal="/export/home/ftarroux/svn_extract/instalC3/"
repertoireTools="/export/home/ftarroux/svn_extract/tools/"
# alias frbuild="bash $repertoireScript/buildPerso.unix"
alias frbuild="python $repertoireScript/frbuild.py"
alias frctest="python $repertoireScript/frctest.py"
# kill all detached screen
killd () {
  for session in $(screen -ls | grep -o '.*Detached' | cut -f2)
  do
    # echo $session
    screen -S "${session}" -X quit;
  done
}


#function frvalid() {
#echo "$1" "$2" "$3"
#frbuild -q -f  "$1" "$2"
#frctest -j 10 "$1" "$2" $3
#}
alias frvalide="python ~/0_SCRIPT/frvalide.py"


alias frprintvarsub="python $repertoireScript/frprintvarsub.py"
# alias tcs="tcs_multi_list.unix daily $repertoireSource/.. instalC3 . gnu opt ${arch} 5"
# alias fgrep="read -p val1 val2 ; echo grep $val1 -r /export/home/ftarroux/svn_extract/c3dev/ -i -n   --include $val2"
function frgrep() {
  if [ -d "_sources" ] ; then
    path="_sources"
  else
    path=$sc3
  fi
  if [[ "$2" != "" ]]
  then
    grep -E "$1" -r "$path" -i -n  --include="${2:-"*.f"}" $3 $4 $5 $6
  else
    grep -E "$1" -r "$path" -i -n  --include="${2:-"*.f"}" --include="${3:-"*.H"}" --include="${4:-"*.fcpp"}" --include="${5:-"*.fpp"}"
  fi
}

function frcall(){
  if [ -d "_sources" ] ; then
    path="_sources"
  else
    path=$sc3
  fi
  if [[ "$2" != "" ]]
  then
    grep -E "CALL.*$1" -r "$path" -i -n  --include="${2:-"*.f"}" $3 $4 $5 $6
  else
    grep -E "CALL.*$1" -r "$path" -i -n  --include="${2:-"*.f"}" --include="${3:-"*.H"}" --include="${4:-"*.fcpp"}"  --include="${5:-"*.fpp"}"
  fi
}

function frreplace() {
  grep -rl "$1" "$sc3"  --include="${3}"  | xargs sed -i "s/$1/$2/g"
}


function frgrepc2() {
  if [[ "$2" != "" ]] ; then
    grep -E "$1" -r "$sc2" -i -n  --include="${2:-"*.f"}"
  else
    grep -E "$1" -r "$sc2" -i -n  --include="${2:-"*.f"}" --include="${3:-"*.H"}" --include="${4:-"*.fcpp"}" --include="${5:-"*.fpp"}"
  fi
}

function frcallc2() {
  if [[ "$2" != "" ]] ; then
    grep -E "CALL.*$1" -r "$sc2" -i -n  --include="${2:-"*.f"}"
  else
    grep -E "CALL.*$1" -r "$sc2" -i -n  --include="${2:-"*.f"}" --include="${3:-"*.H"}" --include="${4:-"*.fcpp"}" --include="${5:-"*.fpp"}"
  fi
}

function frfind() {
  if [ -d "_sources" ] ; then
    path="_sources/"
  else
    path=$sc3
  fi
  find "$path" -iname "$1"

}
function frfindc2() {
  find "$sc2" -iname "$1"
}
function frfindcpp() {
  find "/home/cath23/_base_dev/c3dev/work_Centos7_64_vers_cpp.weekend.validated/." -iname $1
}
# function frtcs() {
# tcs0.unix $1 instalC3 . gnu opt ${arch} 5 erase_fort21
# }

function frtcstotal() {
  /export/home/ftarroux/svn_extract/instal/$1/tools/unix/tcs_multi_list.unix week_end /export/home/ftarroux/svn_extract/instal $1 .  gnu opt $arch 11 erase_fort21
}
function frtcslist() {
  echo $1, $2
  tcs.unix "/export/home/ftarroux/svn_extract/instal" $1 . $2 gnu opt
  # $1 : nom  de l'instal
  # $2 : nom de la liste
}
# alias tcs0.unix="/export/home/ftarroux/svn_extract/c3dev/tools/unix/tcs0.unix"

function frc() {
  rm *.o
  frsources
  ./cathar.unix "$@"
}

function frpdfdocgrep(){
  #allow to grep in found pdf file.
  #$1 = path to pdf
  #$2 = pattern to find
  find "$1" -name '*.pdf' -exec sh -c "pdftotext "{}" - | grep --with-filename --label="{}" --color ${2}" \;
  find "$1" -name '*.doc' -exec grep -il --color "ihk" {} \;
}



alias frvalidation="/export/home/ftarroux/svn_extract/ValidationTools/team/validationProcess.py"
alias frvalidation2="/export/home/ftarroux/svn_extract/tools/team/validationProcess.py"

alias frdocumentation="documentation_version.unix /export/home/ftarroux/svn_extract/c3dev /export/home/ftarroux/svn_extract/c3dev/doc/ all oui DICO compilpdf"

alias frcompilec2="home/cath23/_base_dev/daily_extractions/common/tools/c2_unix/build_c2.unix /export/home/ftarroux/svn_extract v25dev gnu CHECK"
#Lance vim en hyper leger pour ouvrire les gros fichier"
alias frvimlight="vim --noplugin "
# function frvim() {
# ${vimIns} --servername $1 --remote ${2:-'/export/home/ftarroux/svn_extract/c3dev/src/domain/constructor/GOTRAN.f'}
# }

function frneovim() {
  if [[ "$1" != "" ]]
  then
    if [ -d "_sources" ] ; then
      nvim --servername $1 --remote ${2:-"_sources/src/domain/constructor/GOTRAN.f"} ${3:-"/export/home/ftarroux/svn_extract/v25dev/pipe/claws/pb/EQVEPb.f"}
    else
      nvim --servername $1 --remote ${2:-"/export/home/ftarroux/svn_extract/c3dev/src/domain/constructor/GOTRAN.f"} ${3:-"/export/home/ftarroux/svn_extract/v25dev/pipe/claws/pb/EQVEPb.f"}
    fi
  else
    nvim --remote ${2:-"/export/home/ftarroux/svn_extract/c3dev/src/domain/constructor/GOTRAN.f"} ${3:-"/export/home/ftarroux/svn_extract/v25dev/pipe/claws/pb/EQVEPb.f"}
  fi
}

alias nvim="/export/home/ftarroux/Autre/logiciel/nvim-linux64/bin/nvim"
alias vim="~/vimInstal/bin/vim"
alias vimdiff="~/vimInstal/bin/vimdiff"

alias vimterminal='gnome-terminal -- vim'
function frvim() {
  if [[ "$1" != "" ]]
  then
    if [ -d "_sources" ] ; then
      if [ -f "_sources/src/domain/constructor/GOTRAN.cxx" ];then
        gvim --servername $1 --remote ${2:-"_sources/src/domain/constructor/GOTRAN.cxx"} ${3:-"/export/home/ftarroux/svn_extract/v25dev/pipe/claws/pb/EQVEPb.f"}
      elif [ -f "_sources/src/domain/constructor/GOTRAN.f" ];then
        gvim --servername $1 --remote ${2:-"_sources/src/domain/constructor/GOTRAN.f"} ${3:-"/export/home/ftarroux/svn_extract/v25dev/pipe/claws/pb/EQVEPb.f"}
      fi
    else
      gvim --servername $1 --remote ${2:-"/export/home/ftarroux/svn_extract/c3dev/src/domain/constructor/GOTRAN.f"} ${3:-"/export/home/ftarroux/svn_extract/v25dev/pipe/claws/pb/EQVEPb.f"}
    fi
  else
    gvim --remote ${2:-"/export/home/ftarroux/svn_extract/c3dev/src/domain/constructor/GOTRAN.f"} ${3:-"/export/home/ftarroux/svn_extract/v25dev/pipe/claws/pb/EQVEPb.f"}
  fi
}

function frdoccreation(){
  cd /export/home/ftarroux/svn_extract/c3dev/tools/unix/
  documentation_version.unix /export/home/ftarroux/svn_extract/c3dev /export/home/ftarroux/svn_extract/c3dev/doc/ all non DICO compilpdf
}

function frcomparetcs(){
  # cd /export/home/ftarroux/svn_extract/c3dev/tools/core/
  ls /home/cath23/_base_dev/versions/figees/c3dev/
  ls /export/home/ftarroux/svn_extract/instal/

  if [[ "$#" == 2 ]]
  then
    /export/home/ftarroux/svn_extract/instal/$1/tools/core/compareTCS.py -c  /export/home/ftarroux/svn_extract/instal/$1 -r /home/cath23/_base_dev/versions/figees/c3dev/$2
  fi
}
function frcomparetcs2(){
  # cd /export/home/ftarroux/svn_extract/c3dev/tools/core/
  ls /home/cath23/_base_dev/versions/figees/c3dev/
  ls /export/home/ftarroux/svn_extract/instal/

  if [[ "$#" == 2 ]]
  then
    /export/home/ftarroux/svn_extract/instal/$1/tools/core/compareTCS.py -c  /export/home/ftarroux/svn_extract/instal/$1/test -r /home/cath23/_base_dev/versions/figees/c3dev/$2
  fi
}
#Show diff betwteen your commit and branch origine
alias frgitdiffhead="git diff @{u}...HEAD"
# Supprimer les warngins dans la consol (add &> /dev/null)
alias firefox="firefox &> /dev/null"
alias frworkload="o /data/tmpletr/cathare3/InsideTMA/Workload/Workload_count_ft_reformulation.ods"
alias frdistatc2="o /data/tmpletr/cathare3/InsideTMA/diStatus/CATHARE2_DI_STATUT_2018_sw26.ods"
alias frdistatc3="o /data/tmpletr/cathare3/InsideTMA/diStatus/CATHARE3_DI_STATUS_2018_sw26.ods"
#if [ -e /usr/bin/vimx ]; then alias vim='/usr/bin/vimx'; fi

# alias prepaMail="/export/home/ftarroux/svn_extract/tools/team/prepa_mail.py -r /home/cath23/_base_dev/versions/figees/c3dev/work_Centos7_64.271117_v2.0.320/ -n /home/cath23/_base_dev/versions/figees/c3dev/work_Centos7_64.171121_v2.0.306/"

alias frtestVersionEnChaine="~/0_SCRIPT/frtestVersionEnChaine.py"
function freosjdd(){
  g++ -g -o $1.exe $1 -I /home/cath23/_base_dev/prerequisites/eos/Fedora24_64/eos-1.6.0-dbg/include -L /home/cath23/_base_dev/prerequisites/eos/Fedora24_64/eos-1.6.0-dbg/lib/ -leos
  LD_LIBRARY_PATH=/home/cath23/_base_dev/prerequisites/eos/Fedora24_64/eos-1.6.0-dbg/lib
}
# Command to instal in specified directory (no root used)
# pip install --ignore-installed --install-option="--prefix=/export/home/ftarroux/logiciel/Kate" Kate-plugins
function volumePlus() {
  VOLUME='+5%'
  for SINK in `pacmd list-sinks | grep 'index:' | cut -b12-`
  do
    pactl set-sink-volume $SINK $VOLUME
  done
}
function volumeMoins() {
  VOLUME='-5%'
  for SINK in `pacmd list-sinks | grep 'index:' | cut -b12-`
  do
    pactl set-sink-volume $SINK $VOLUME
  done

}


if [[ $HOSTNAME == "is227550.intra.cea.fr" ]] ; then
  alias firefox="/export/home/ftarroux/Autre/logiciel/firefox/firefox &> /dev/null"
  alias thunderbird="/export/home/ftarroux/Autre/logiciel/thunderbird/thunderbird"
  alias eclipse="ulimit -c unlimited ; export SWT_GTK3=0 ; /export/home/ftarroux/Autre/logiciel/Eclipse/eclipse/eclipse"
  # alias guithare="/export/home/ftarroux/Autre/logiciel/GUITHARE_V2.1.3/executable/run.csh"
  if [ "$VIM" == "" ]; then
    PROMPT_COMMAND="killd;newBashToSource;$PROMPT_COMMAND"
  fi

fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# look if bashrc at change. it s used $bashrc_sourced who be set at begin file
function newBashToSource(){
  test $(stat -c %Y ~/.bashrc) -ne $bashrc_sourced && source ~/.bashrc
}

# source automaticaly bashrc on command if he has change (to keep at end of bashrc)
# if [ "$VIM" == "" ]; then
#   export PROMPT_COMMAND="killd;newBashToSource;$PROMPT_COMMAND"
# fi

#  echo "non vim environnement"
#  bashrc_sourced=$(stat -c %Y ~/.bashrc)
#  PROMPT_COMMAND='
#    # test $(stat -c %Y ~/.bashrc) -ne $bashrc_sourced && source ~/.bashrc ;
#    #windows title
#    chemin='$(pwd|rev|cut -d"/" -f1-3|rev)';
#    echo -ne "\033]0;${chemin}\007";
#  '
## PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
##   PS1="\[$FGCYN\][\[$FGMAG\]\u\[$FGBLU\]@\[$FGGRN\]\h\[$FGYLO\](\t)\[$FGRED\]$chemin\[$FGCYN\]]\$\[$RESET\]"

#fi



