# Openbox environment

## The basic files of Openbox are:
### ~/.config/openbox/rc.xml
is the main configuration file, responsible for determining the behaviour and settings of the overall session, including:

- Keyboard shortcuts (e.g. starting applications; controlling the volume)
- Theming
- Desktop and Virtual desktop settings
- Application Window settings

This file is also pre-configured, meaning that it will only be necessary to amend existing content in order to customise behaviour to suit personal preference.

### ~/.config/openbox/menu.xml

defines the type and behaviour of the desktop menu, accessible by right-clicking the background. Although the default provided is a static menu (meaning that it will not automatically update when new applications are installed), it is possible to employ the use of dynamic menus that will automatically update as well.

### ~/.config/openbox/autostart

openbox-session provides two autostart mechanisms: XDG Autostart (which only works if python2-xdg is installed) and Openbox's own autostart mechanism.

Openbox's own autostart mechanism:

sources /etc/xdg/openbox/environment
sources ~/.config/openbox/environment
runs /etc/xdg/openbox/autostart
runs ~/.config/openbox/autostart

Issues regarding commands in ~/.config/openbox/autostart being executed out of order (or skipped altogether) are often resolved by the addition of small delays. For instance:

```
xset -b
(sleep 3s && nm-applet) &
(sleep 3s && conky) &
```

### ~/.config/openbox/environment

can be used to export and set relevant environmental variables such as to:

- Define new pathways (e.g. execute commands that would otherwise require the entire pathway to be listed with them)
- Change language settings
- Define other variables to be used (e.g. the fix for GTK theming could be listed here)

## Themes

### GUI
- ObConf
- LXAppearance Obconf
- LXinput -> LXDE Input/Keyboard
- LXRandR -> LXDE monitor config
- OBKey -> Keybinds
- ob-autostart -> autostart
- obapps
