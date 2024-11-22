isudo pacman -S xf86-input-libinput    # For Arch-based distros
sudo apt install xserver-xorg-input-libinput # For Debian-based distros

sudo nano /etc/X11/xorg.conf.d/30-touchpad.conf

Section "InputClass"
    Identifier "touchpad"
    MatchIsTouchpad "on"
    Driver "libinput"
    Option "Tapping" "on"         # Enable tap-to-click
    Option "NaturalScrolling" "on" # Enable natural scrolling
    Option "ClickMethod" "clickfinger" # Enable clicking with fingers
EndSection

Section "InputClass"
    Identifier "touchpad"
    Driver "synaptics"
    MatchIsTouchpad "on"
    Option "TapButton1" "1"       # Enable single-finger tap-to-click
    Option "VertEdgeScroll" "on"  # Enable vertical edge scrolling
    Option "HorizEdgeScroll" "on" # Enable horizontal edge scrolling
EndSection


xinput set-prop device_id "libinput Tapping Enabled" 1

