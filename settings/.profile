# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export WALLPAPER=$HOME/.wallpapers/mountains-3.jpg
export DEFAULT_FONT="Hack:style=Regular"

# Default Applications
export EDITOR=/usr/bin/xed
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/chromium
export PDFVIEWER=/usr/bin/zathura
export FILEMAN=/usr/bin/thunar
export TERMINAL=/usr/bin/urxvt

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
