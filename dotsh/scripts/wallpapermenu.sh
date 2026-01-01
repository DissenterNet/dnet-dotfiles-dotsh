#!bin/bash

FOLDER=~/stuff/wallpapers
SCRIPT=~/dotfiles/dotsh/scripts

menu () {
        # CHOICE=$(echo -e "Random\n$(command ls -v $FOLDER)" | dmenu -c -l 15 -i -p "wallpaper: ")
        CHOICE=$(nsxiv -otb $FOLDER/*) # nsxiv -o writes filename to stdout

case $CHOICE in
        # Random) wal -i "$FOLDER" -o $SCRIPT ;; # w/ dmenu
        *.*) wal -i "$CHOICE" -o $SCRIPT ;;
        *) exit 0 ;;
esac
}

case "$#" in
        0) menu ;;
        1) wal -i "$1" -o $SCRIPT ;;
        2) wal -i "$1" --theme $2 -o $SCRIPT ;;
        *) exit 0 ;;
esac
