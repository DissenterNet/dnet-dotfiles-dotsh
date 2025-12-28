#!/bin/bash
export -a
# Sources.
. /etc/.GLOBALS/bash/alias.config.sh

###
# Contitional aliases.
###

# clear
c() {
    command clear

    # Check USE_LS true/fale
    if [ "$USE_LS" = true ]; then
	ls_command="ls -A"

	# Check USE_COLOR
	if [ "$USE_COLOR" = true ]; then
	    ls_command="$ls_command --color=auto"
        fi

	# Execute the ls command
	command $ls_command
    fi
}

cd() {
    command cd "$@"
    if [ "$USE_LS" = true ]; then
        command ls -A --color=auto
    fi
}


###
# USE_COLOR
###


