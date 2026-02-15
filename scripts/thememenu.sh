#!/bin/bash

# 1. Dynamically list all folders in your colorschemes directory
# This ignores files and only grabs folder names
options=$(ls -d $HOME/.config/colorschemes/*/ | xargs -n 1 basename)

# 2. Show the menu via Wofi
selected=$(echo -e "$options" | wofi --dmenu --conf ~/.config/wofi/config.themes)

# 3. If a theme is selected, run the switcher
if [ ! -z "$selected" ]; then
    /home/xpczf/.config/scripts/theme-switcher.sh "$selected"
fi
