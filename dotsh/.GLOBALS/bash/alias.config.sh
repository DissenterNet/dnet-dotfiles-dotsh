#!/bin/bash
export -a
###
# ALIAS.CINFIG
###

refresh="/etc/bash.bashrc"
# Function for toggling variables.
config_toggle() {
    local config_file="/etc/.GLOBALS/bash/alias.config.sh"     # Get absolute path of current file.

    for var_name in "$@"; do    # Loop thru all arguments.
        if grep -q "^export $var_name=true" "$config_file"; then
            sed -i "s/^export $var_name=true/export $var_name=false/" "$config_file"
            echo "$var_name is now disabled."
        elif grep -q "^export $var_name=false" "$config_file"; then
            sed -i "s/^export $var_name=false/export $var_name=true/" "$config_file"
            echo "$var_name is now enabled."
        else
            echo "$var_name not found in $config_file."
        fi
    done

    # Refresh.
    . "$config_file"
    . "$refresh"
}


###
# alias.config Variables.
###

# Toggles wether to add "ls -a" at the end of some commands.
export USE_LS=true
# Toggles wether to use --color-auto, --color-always or not.
export USE_COLOR=true

