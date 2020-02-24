# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

# Ruby
export GEM_HOME=$HOME/.gem
export GEM_PATH=$(ruby -e 'puts Gem.user_dir')
export PATH=$HOME/.local/bin:$PATH
export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export WALLPAPER=$HOME/.wallpapers/cat-coffee.png
export DEFAULT_FONT="Hack:style=Regular"

# Default Applications
export EDITOR=/usr/bin/xed
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/chromium
export PDFVIEWER=/usr/bin/zathura
export FILEMAN=/usr/bin/thunar
export TERMINAL=/usr/bin/urxvt
