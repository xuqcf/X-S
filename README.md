
---

# X-S

A modular theme engine and configuration suite for Hyprland. This tool allows you to switch between diverse color schemes—such as Catppuccin, Gruvbox, and Nord—across your entire desktop environment.

## Repository Structure

* **scripts/**: Core logic for theme switching and UI menus.
* **colorschemes/**: Master color definitions and specialized config snippets.
* **waybar/** / **wofi/** / **alacritty/**: App-specific configurations that respond to theme changes.
* **hypr/**: Hyprland-specific styling, including the dynamic hyprtheme.conf.

## Requirements

Before setting up, ensure the following are installed:

* Hyprland (Window Manager)
* Wofi (Menu system)
* Waybar (Status bar)
* Alacritty (Terminal emulator)
* git (To clone and update)

## Setup and Installation

1. **Clone the repository**:
```bash
git clone https://github.com/xuqcf/X-S.git ~/.config/temp-xs

```


2. **Deploy Configurations**:
Move the folders to your ~/.config directory. Back up your existing configurations before proceeding:
```bash
cp -r ~/.config/temp-xs/* ~/.config/

```


3. **Set Permissions**:
Make the scripts executable:
```bash
chmod +x ~/.config/scripts/*.sh

```


4. **Initialize**:
Run the switcher for the first time to generate your initial config:
```bash
~/.config/scripts/theme-switcher.sh

```



## Adding New Themes

To add a new theme, create a new folder within colorschemes/ and include the necessary .conf or .css files that match the existing structure.

## Contributing

If you want to contribute new color schemes or optimizations:

1. Fork the repo.
2. Create a new branch: `git checkout -b feature/NewTheme`
3. Commit your changes.
4. Push to the branch and open a Pull Request.

**Contact me on Discord for questions or collaboration:**

> **Discord:** @xfqei

---

*Built for the Linux Community.*

---
