#!/bin/bash

# Check for minimum needed software.
if ! [ "$(command -v stow)" ] || ! [ "$(command -v git)" ]; then
    printf '\e[31mYou need to have GNU stow and git installed.\nExiting...\n'
    exit 1
fi

# Add baph
git clone https://bitbucket.org/natemaia/baph.git
cd baph && make install
cd ..

#baph --install --noview --noconfirm
# First base requirements
echo "Installing basic requirements"
baph -inN base-devel git stow

echo "Basic setup"
baph -inN pakku pakku-gui \
polkit-dumb-agent-git \
python-pip numlockx evince neofetch \
google-chrome rofi-calc bitwarden-rofi \
udiskie playerctl \
spotify spicetify-cli spicetify-themes-git \
lm-sensors jq feh \
/

echo "Installing Fonts"
baph -iNn nerd-fonts-fantasque-sans-mono otf-overpass \
nerd-fonts-fira-mono nerd-fonts-ubuntu-mono \
nerd-fonts-source-code-pro otf-hasklig \
nerd-fonts-fantasque-sans-mono nerd-fonts-cascadia-code \
/

echo "Installing themes and icons"
baph -inN boston-icon-theme-git arc-icon-theme-git newaita-icons-git

# i3 installs
echo "Installing i3 and sway requirements"
baph -iNn i3-gaps sway wslroots waybar nwg-wrapper dunst rofi

# Photography
baph -inN perl-image-exiftool exiv2 pyexiftool-gui-git rawtherapee shotwell

# Ruby for life
baph -inN ruby
gem install jekyll github-pages
gem install irb

# Work installs
baph -iNn ica-client \
pidgin pidgin-sipe \
bitwarden zettlr typora\
visual-studio-code \
pdk puppet-bolt docker \
/

# Install e-id stuff; this is Belgian users only
baph -inN ccid pcsclite eid-mw acsccid
sudo systemctl enable pcscd.socket
modutil -dbdir sql:.pki/nssdb/ -add "Belgium eID" -libfile /usr/lib/libbeidpkcs11.so

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mkdir $HOME/.zsh_custom
# Add Starship
baph -inN Starship

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
#192.168.0.116:/DataVol1/Photos 	    /mnt/NAS/photos 	nfs 	nouser,rsize=8192,wsize=8192,atime,auto,rw,dev,exec,suid 	0 0
#192.168.0.116:/DataVol1/Multimedia 	/mnt/NAS/media 		nfs 	nouser,rsize=8192,wsize=8192,atime,auto,rw,dev,exec,suid 	0 0

# pull it down
mkdir -p ~/Projects/dotties && cd ~/Projects/dotties
git clone https://github.com/moonwitch/dotties.git
git submodule init
git submodele update

# stow it
stow -Rv settings themes
#stow -Rv i3
