# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

# Ruby
export GEM_HOME=$HOME/.gem
export GEM_PATH=$(ruby -e 'puts Gem.user_dir')
export PATH=$HOME/.local/bin:$PATH
export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

# Homebrew
[ -d /home/linuxbrew/.linuxbrew ] && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# Set theme properly
export QT_QPA_PLATFORMTHEME="qt5ct"
# Enable HiDPI
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_FONT_DPI=96 vym
export QT_ENABLE_HIGHDPI_SCALING=1
# export QT_SCREEN_SCALE_FACTORS=1
export QT_SCALE_FACTOR=1
# export GDK_SCALE=2
# export GDK_DPI_SCALE=0.5

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export WALLPAPER=$HOME/.wallpapers/Trust-this-computer.jpg
export DEFAULT_MONO_FONT="Hasklug Nerd Font Mono:style=Regular"
export DEFAULT_FONT="Hasklug Nerd Font:style=Regular"

export XDG_CONFIG_HOME="$HOME/.config"

# Default Applications
export EDITOR=/usr/bin/xed
export PDFVIEWER=/usr/bin/zathura
export FILEMAN=/usr/bin/thunar
export TERMINAL=/usr/bin/urxvt
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/brave
