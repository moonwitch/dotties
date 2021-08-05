#!/bin/bash

## Declare array of to be installed items
declare -a appList=(
"stow" 
"git"
"base-devel"
"zsh"
"franz-bin"
)
# Configure vim/nvim
cat <<'EOT' >> ~/.config/nvim/init.vim
set runtimepath^=~/.vim runtime+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
EOT

# Add some toolings via Curl first
curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh


# Check for minimum needed software.
if ! [ "$(command -v stow)" ] || ! [ "$(command -v git)" ]; then
    printf '\e[31mYou need to have GNU stow and git installed.\nExiting...\n'
    exit 1
fi

for app in appList; do
    # Do something
done

#baph --install --noview --noconfirm
# First base requirements
echo "Installing basic requirements"
baph -inN base-devel git stow

echo "Basic setup"
baph -inN pamac-aur pamac-zsh-completions \
python-pip numlockx evince neofetch \
chromium \
rofi-calc bitwarden-rofi \
udiskie \
playerctl spotify spicetify-cli spicetify-themes-git \
xorg-xwininfo \
polkit-gnome \
lm-sensors jq feh xfce4-power-manager \
alsa-utils shared-mime-info gdk-pixbuf2 \
wpgtk-git \
flameshot copyq \
/

echo "Installing Fonts"
baph -iNn nerd-fonts-fantasque-sans-mono nerd-fonts-fira-code \
nerd-fonts-fira-mono ttf-comfortaa nerd-fonts-victor-mono \
nerd-fonts-ubuntu-mono nerd-fonts-source-code-pro \
otf-overpass nerd-fonts-iosevka otf-hasklig \
nerd-fonts-fira-mono nerd-fonts-fira-code \
nerd-fonts-fantasque-sans-mono nerd-fonts-cascadia-code \
/

echo "Installing themes and icons"
baph -inN zafiro-icon-theme-git boston-icon-theme-git arc-icon-theme-git newaita-icons-git 

# i3 installs
echo "Installing i3 and sway requirements"
baph -iNn i3-gaps sway wslroots waybar

# Photography
baph -inN perl-image-exiftool exiv2 pyexiftool-gui-git rawtherapee shotwell

# Ruby for life
baph -inN ruby
gem install jekyll
gem install irb

# Work installs
baph -iNn networkmanager-openconnect \
pidgin mattermost-desktop-bin \
bitwarden zettlr \
visual-studio-code-insiders \
pdk docker \
/

# Install e-id stuff; this is Belgian users only
baph -inN ccid pcsclite eid-mw acsccid
sudo systemctl enable pcscd.socket
modutil -dbdir sql:.pki/nssdb/ -add "Belgium eID" -libfile /usr/lib/libbeidpkcs11.so

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mkdir $HOME/.zsh_custom
curl -L https://raw.githubusercontent.com/dikiaap/dotfiles/master/.oh-my-zsh/themes/oxide.zsh-theme > $HOME/.zsh_custom/oxide.zsh-theme

# Install oh-my-fish
sh -c "$(curl -L https://get.oh-my.fish > install )"
fish install --path=~/.local/share/omf --config=~/.config/omf
omf install bobthefish  
set -g theme_nerd_fonts yes

# Requirements for Gmail script
pip install --global --upgrade oauth2client google-api-python-client

# Services
sudo systemctl start systemd-timesyncd
sudo systemctl enable systemd-timesyncd

# Shares
sudo mkdir -p /mnt/NAS/{media,photos}
sudo mkdir -p /mnt/storage
sudo sh -c 'echo "UUID=$(lsblk -no UUID /dev/sdb1)      /mnt/storage        $(lsblk -no FSTYPE /dev/sdb1)       defaults,noatime    0 2" >> /etc/fstab'

# QNAP
192.168.0.116:/DataVol1/Photos 	    /mnt/NAS/photos 	nfs 	nouser,rsize=8192,wsize=8192,atime,auto,rw,dev,exec,suid 	0 0
192.168.0.116:/DataVol1/Multimedia 	/mnt/NAS/media 		nfs 	nouser,rsize=8192,wsize=8192,atime,auto,rw,dev,exec,suid 	0 0

# pull it down
# mkdir -p ~/Projects/dotties && cd ~/Projects/dotties
# git clone https://github.com/moonwitch/dotties.git && rm -rf ~/Projects/dotties/.git
# git submodule init
# git submodele update

# stow it
stow -Rv settings themes
stow -Rv i3
