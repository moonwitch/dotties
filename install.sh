#!/bin/bash
#baph --install --noview --noconfirm
# First base requirements
baph -inN base-devel git stow

baph -inN pamac-aur pamac-zsh-completions \
nerd-fonts-fantasque-sans-mono nerd-fonts-fira-code nerd-fonts-fira-mono nerd-fonts-jetbrains-mono \
ttf-comfortaa \
python-pip numlockx zathura neofetch \
chromium caprine \
synology-drive \
udiskie \
kakoune \
playerctl \
spotify spicetify-cli spicetify-themes-git \
/

echo "Installing themes and icons"
baph -inN zafiro-icon-theme-git \
boston-icon-theme-git \
arc-icon-theme-git \
oranchelo-icon-theme-git \
paper-icon-theme-git \
/

# i3 installs
echo "Installing i3 requirements"
baph -iNn i3-gaps i3blocks-git i3blocks-contrib-git \
meson wlroots \
wayland wayland-protocols pcre \
json-c pango cairo gdk-pixbuf2 \
scdoc \
sway-hidpi-git \
/

# Photography
#! /bin/bash
baph -inN perl-image-exiftool exiv2 pyexiftool-gui-git

# Ruby for life
baph -inN ruby

# Work installs
baph -iNn networkmanager-openconnect \
pidgin \
mattermost-desktop-bin \
bitwarden \
rbw \
firefox \
/

# Install e-id stuff; this is Belgian users only
baph -inN ccid pcsclite eid-mw acsccid
sudo systemctl enable pcscd.socket
sudo systemctl start pcscd.socket
modutil -dbdir sql:.pki/nssdb/ -add "Belgium eID" -libfile /usr/lib/libbeidpkcs11.so

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
brew install gcc

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mkdir $HOME/.zsh_custom
curl -L https://raw.githubusercontent.com/dikiaap/dotfiles/master/.oh-my-zsh/themes/oxide.zsh-theme > $HOME/.zsh_custom/oxide.zsh-theme

# Requirements for Gmail script
pip install --global --upgrade oauth2client google-api-python-client

# Install lightdm looker
# systemctl enable betterlockscreen@$USER
baph -inN lightdm-webkit-theme-aether

# Fix Grub2
#sudo -s echo "GRUB_GFXMODE=3840x2160x24" >> /etc/default/grub
#sudo grub-mkconfig -o /boot/grub/grub.cfg

# Generate my ssh key for github/bitbucket
# ssh-keygen -t rsa -b 4096 -C "kelly.crabbe@gmail.com"

# Services
# systemctl --user start spotifyd.service
# systemctl --user enable spotifyd.service
sudo systemctl start systemd-timesyncd
sudo systemctl enable systemd-timesyncd

# Shares
sudo mkdir -p /mnt/work/{home,buo,portimaprod,portimaqual,spotlight}
sudo mkdir -p /mnt/NAS/{media,photos,software}
#sudo mount.cifs -o username=intamv\\700320 //fci.fortis/amv/buo /mnt/work/buo
#sudo mount -t cifs -o username=intamv\\700320 //fci.fortis/acidfs01/brulthome/700320 /mnt/work/home
sudo mkdir -p /mnt/storage
sudo echo "UUID=$(lsblk -no UUID /dev/sdb1) /mnt/storage $(lsblk -no FSTYPE /dev/sdb1) defaults,noatime 0 2" >> /etc/fstab
