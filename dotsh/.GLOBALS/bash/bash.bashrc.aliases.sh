#!/bin/bash
# SOURCES
. /etc/.GLOBALS/bash/alias.conditionals.sh
. /etc/.GLOBALS/bash/alias.pacman.sh

#export -a
#set -a
#. bash.bashrc.aliases.sh

###
# "dnet"
###


alias l=" ls -A --color=auto "
alias ls=" ls --color=auto "
alias grep=" grep --color=auto "
alias mv=" mv -i "
alias rm=" rm -i "
alias ll=" ls -alF "

alias bg=" wal -i ~/stuff/wallpapers "
alias gpu=" nvtop "
alias cpu=" htop "
alias matrix=" cmatrix -a "q

###
# BASH
###


alias b=" sudo nano /etc/bash.bashrc "
alias bu=" . ~/.bashrc && .  /etc/bash.bashrc "
alias ba=" sudo nano /etc/.GLOBALS/bash/bash.bashrc.aliases.sh "
alias bc=" sudo nano /etc/.GLOBALS/bash/alias.conditionals.sh "
alias bf=" sudo nano /etc/.GLOBALS/bash/bash.bashrc.functions.sh "
alias bv=" sudo nano /etc/.GLOBALS/bash/alias.config.sh "



###
# NAVIGATION
###


alias ,=" cd .. "
alias ..=" cd ../.. "
alias ...=" cd ../../.. "
alias ....=" cd ../../../.. "
alias .....=" cd ../../../../.. "

###
# SYSTEM
###

alias s=" sudo "
alias smc=" sudo mc "
alias snano=" sudo nano "
alias schmod=" sudo chmod "
alias wifi=" sudo nmtui "
alias dwm=" startx "

###
# EXECUTE
###

alias mouse=" sudo systemctl start gpm "
alias xmouse=" sudo systemctl stop gpm "
