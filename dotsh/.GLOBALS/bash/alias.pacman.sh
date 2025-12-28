#1/bin/bash

###
# PACMAN.SH.
###

###
# Aliases
###

alias p=" sudo pacman "         # Shortcut.
alias pu="p -Syu "              # Update db and upgrade.
alias pi=" p -Sy --needed "     # Install only if needed.
alias pr=" p -R "               # Remove.
alias pq=" p -Q "               # Query installed.
alias ps=" p -Ss "              # Search repos for.
alias pinfo=" p -Si "           # Shows detailed information.
alias pl=" p -Qqe "             # List explicitly installed.
alias po=" p -Qdt "             # Lists orphans.
alias pro="p -Rns $(p -Qdt) "   # Removes orphans.
alias psf=" p -F "              # Searchs for specific file.
alias pcheck=" p -Qk"           # Checks for missing files.
alias pown=" p -Qo "            # Which package owns a file.




