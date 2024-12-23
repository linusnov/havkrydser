<div align="center">
  <h1> Dotfiles Conf </h1>
</div>
<p align="center">Configuration</p>
<div align="center">
</div>

# Install

```sh
# In your terminal

╭─mac at mac’s iMac in ~/Desktop
╰─ փ >> gh repo clone linusnov/havkrydser
```

## Edit your xinitrc

```sh
# Edit the document ".xinitc" with

sxhkdrc &
exec bspwm
```

# Dependencies

- [x] sxhkd
- [x] bspwm
- [x] picom
- [x] rofi
- [x] pcmanfm
- [x] browser
- [x] nitrogen
- [x] lxappearance
- [x] polybar
- [x] tilix
- [x] lolcat
- [x] toilet
- [x] nm-connection-editor
- [x] redshift

### For printers

```
sudo pacman -S cups cups-pdf system-config-printer gutenprint

sudo systemctl start cups

sudo systemctl enable cups

# Localhost
http://localhost:631

```


- [x] system-config-printer
- [x] simple-scan
