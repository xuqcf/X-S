
---

```markdown
# X-S (X-Style) 

A modular theme engine and configuration suite for Hyprland. X-S allows you to switch between diverse color schemes (Catppuccin, Gruvbox, Nord, etc.) seamlessly across your entire desktop environment.

##  Repository Structure

- **scripts/**: Core logic for theme switching and UI menus.
- **colorschemes/**: Master color definitions and specialized config snippets.
- **waybar/ / wofi/ / alacritty/**: App-specific configurations that respond to X-S theme changes.
- **hypr/**: Hyprland-specific styling, including the dynamic `hyprtheme.conf`.

## Requirements

Before setting up, ensure you have the following installed:
* **Hyprland** (Window Manager)
* **Wofi** (Menu system)
* **Waybar** (Status bar)
* **Alacritty** (Terminal emulator)
* **git** (To clone and update)

##  Setup & Installation

1. **Clone the repository**:
   ```bash
   git clone [https://github.com/xuqcf/X-S.git](https://github.com/xuqcf/X-S.git) ~/.config/temp-xs

```

2. **Deploy Configurations**:
Move the folders to your `~/.config` directory (ensure you backup your old configs first!):
```bash
cp -r ~/.config/temp-xs/* ~/.config/

```


3. **Set Permissions**:
Make sure the scripts are executable:
```bash
chmod +x ~/.config/scripts/*.sh

```


4. **Initialize**:
Run the switcher for the first time to generate your initial config:
```bash
~/.config/scripts/theme-switcher.sh

```



##  Adding New Themes

To add a new theme, create a new folder within `colorschemes/` and include the necessary `.conf` or `.css` files that match the existing structure.

##  Contributing

I am always looking for new color schemes and optimizations! If you want to contribute:

1. Fork the repo.
2. Create a new branch (`git checkout -b feature/NewTheme`).
3. Commit your changes.
4. Push to the branch and open a Pull Request.

**Contact me on Discord for questions or collaboration:**

>  **Discord:** `@xfqei`

---

Built with ❤️ for the Linux Community.





