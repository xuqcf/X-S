#!/bin/bash

# Define theme and paths
CURRENT_THEME=$(cat /tmp/current_theme 2>/dev/null || echo "Toji")
WALL_DIR="$HOME/.config/colorschemes/$CURRENT_THEME/wallpaper"
CACHE_DIR="$HOME/.cache/wallpaper_thumbs"
W_CONF="$HOME/.config/wofi/config.wallpaper"

mkdir -p "$CACHE_DIR"

# Generate the list for Wofi
# We use 'basename' to ensure we only pass the filename to the next step
selected=$(find "$WALL_DIR" -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" \) | while read -r img; do
    img_name=$(basename "$img")
    thumb="$CACHE_DIR/$img_name.png"
    
    if [ ! -f "$thumb" ]; then
        convert "$img" -thumbnail 200x200^ -gravity center -extent 200x200 "$thumb"
    fi
    echo -en "img:$thumb:text:$img_name\n"
done | wofi --dmenu --conf "$W_CONF")

# If something was selected, strip the 'img:...:text:' prefix
if [ ! -z "$selected" ]; then
    # This line extracts just the filename from the Wofi output
    file_to_apply=$(echo "$selected" | awk -F ':' '{print $NF}')
    
    # Apply using swww
    swww img "$WALL_DIR/$file_to_apply" --transition-type grow --transition-pos center
    notify-send "Wallpaper Changed" "Applied $file_to_apply"
fi
