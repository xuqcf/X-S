#!/bin/bash

# Save the current theme name to a temp file
echo "$1" > /tmp/current_theme
THEME=$1
SCHEME_DIR="$HOME/.config/colorschemes/$THEME"

# --- Safety Check ---
if [ ! -d "$SCHEME_DIR" ]; then
    notify-send "Theme Error" "Folder $THEME not found!"
    exit 1
fi

# --- 1. Update Hyprland & Waybar Colors ---
cp "$SCHEME_DIR/hypr/colors.conf" "$HOME/.config/hypr/hyprtheme.conf"
cp "$SCHEME_DIR/waybar/colors.css" "$HOME/.config/waybar/colors.css"

# --- 2. Update Wallpaper ---
WALLPAPER=$(find "$SCHEME_DIR/wallpaper" -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" \) | head -n 1)
if [ -f "$WALLPAPER" ]; then
    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload "$WALLPAPER"
    hyprctl hyprpaper wallpaper "DP-1,$WALLPAPER"
fi

# --- 3. Update Wofi ---
if [ -d "$SCHEME_DIR/wofi" ]; then
    mkdir -p "$HOME/.config/wofi"
    [ -f "$SCHEME_DIR/wofi/style.css" ] && cp "$SCHEME_DIR/wofi/style.css" "$HOME/.config/wofi/style.css"
    [ -f "$SCHEME_DIR/wofi/config" ] && cp "$SCHEME_DIR/wofi/config" "$HOME/.config/wofi/config"
fi

# --- 4. GTK & Gedit Logic ---
# This updates the variables imported by your master gtk.css
if [ "$THEME" == "Sukuna" ]; then
    GTK_VARS="@define-color accent_color #ff003c; @define-color accent_bg_color #ff003c; @define-color window_bg_color #0f0505; @define-color window_fg_color #f5e0dc; @define-color sidebar_bg_color #1a0f0f;"
    gsettings set org.gnome.gedit.preferences.editor style-scheme-for-dark-theme-variant 'oblivion'

elif [ "$THEME" == "Toji" ]; then
    GTK_VARS="@define-color accent_color #9d7cd8; @define-color accent_bg_color #9d7cd8; @define-color window_bg_color #0d0d0f; @define-color window_fg_color #c0caf5; @define-color sidebar_bg_color #131315;"
    gsettings set org.gnome.gedit.preferences.editor style-scheme-for-dark-theme-variant 'solarized-dark'

elif [ "$THEME" == "Nord" ]; then
    GTK_VARS="@define-color accent_color #88c0d0; @define-color accent_bg_color #81a1c1; @define-color window_bg_color #2e3440; @define-color window_fg_color #d8dee9; @define-color sidebar_bg_color #3b4252;"
    gsettings set org.gnome.gedit.preferences.editor style-scheme-for-dark-theme-variant 'classic'

elif [ "$THEME" == "Gruvbox Material" ]; then
    GTK_VARS="@define-color accent_color #e78a4e; @define-color accent_bg_color #a89984; @define-color window_bg_color #282828; @define-color window_fg_color #dfbf8e; @define-color sidebar_bg_color #32302f;"
    gsettings set org.gnome.gedit.preferences.editor style-scheme-for-dark-theme-variant 'tango'

elif [ "$THEME" == "Catppuccin Mocha" ]; then
    GTK_VARS="@define-color accent_color #f5e0dc; @define-color accent_bg_color #b4befe; @define-color window_bg_color #1e1e2e; @define-color window_fg_color #c0caf5; @define-color sidebar_bg_color #181825;"
    gsettings set org.gnome.gedit.preferences.editor style-scheme-for-dark-theme-variant 'oblivion'
fi

# Inject colors into the CSS variables file
echo "$GTK_VARS" > "$HOME/.config/gtk-3.0/colors.css"
echo "$GTK_VARS" > "$HOME/.config/gtk-4.0/colors.css"

# --- 5. Update Alacritty ---
if [ -d "$SCHEME_DIR/alacritty" ]; then
    cp "$SCHEME_DIR/alacritty/colors.toml" "$HOME/.config/alacritty/alacritty-theme.toml"
fi

# --- 6. Reload Services ---
# Force Waybar to restart correctly to apply new internal colors
hyprctl reload
killall waybar; sleep 0.5; waybar & disown

# Optional: restart some GTK apps to apply colors if needed
# killall thunar; thunar --daemon & disown

notify-send "Theme Applied" "Switched to $THEME Mode"
