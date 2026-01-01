###------- /etc/bash.bashrc
# Toggle # to enable/disable debugging mode.
#set -x
# Uncomment to enable exit mode. script will exit immediately on exit <= 1.
#set -e


###
# SOURCES
###

source ~/dotfiles/dotsh/.GLOBALS/bash/bash.bashrc.aliases.sh
source ~/dotfiles/dotsh/.GLOBALS/bash/bash.bashrc.functions.sh
source ~/dotfiles/dotsh/.GLOBALS/bash/bash.bashrc.variables.sh

# [-f ~/.config/shell/fzfrc ] && source ~/.config/shell/fzfrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prevent doublesourcing
if [[ -z "${BASHRCSOURCED}" ]] ; then
  BASHRCSOURCED="Y"
  
  # the check is bash's default value
  [[ "$PS1" = '\v\$ ' ]] && PS1='[\W]\$ '
  case ${TERM} in
    Eterm*|alacritty*|aterm*|foot*|gnome*|konsole*|kterm*|putty*|rxvt*|tmux*|xterm*)
      PROMPT_COMMAND+=('printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"')
      ;;
    screen*)
      PROMPT_COMMAND+=('printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"')
      ;;
  esac
fi

if [[ -r /usr/share/bash-completion/bash_completion ]]; then
  . /usr/share/bash-completion/bash_completion
fi

neofetch
