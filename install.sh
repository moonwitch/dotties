#!/bin/bash

# Check for minimum needed software.
if ! [ "$(command -v stow)" ] || ! [ "$(command -v git)" ]; then
    printf '\e[31mYou need to have GNU stow and git installed.\nExiting...\n'
    exit 1
fi

#baph --install --noview --noconfirm
# First base requirements
echo "Installing basic requirements"
baph -inN base-devel git stow

echo "Basic setup"
baph -inN pamac-aur pamac-zsh-completions \
python-pip numlockx evince neofetch \
chromium synology-drive \
rofi-calc \
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
baph -iNn i3-gaps sway-git wslroots-git

# Photography
baph -inN perl-image-exiftool exiv2 pyexiftool-gui-git

# Ruby for life
baph -inN ruby
gem install jekyll
gem install irb

# Work installs
baph -iNn networkmanager-openconnect \
pidgin mattermost-desktop-bin \
bitwarden rbw joplin \
visual-studio-code-insiders \
pdk docker \
/

# Install e-id stuff; this is Belgian users only
baph -inN ccid pcsclite eid-mw acsccid
sudo systemctl enable pcscd.socket
modutil -dbdir sql:.pki/nssdb/ -add "Belgium eID" -libfile /usr/lib/libbeidpkcs11.so

# Install Homebrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
brew install gcc

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

# Install lightdm looker
# systemctl enable betterlockscreen@$USER
baph -inN lightdm-webkit-theme-aether

# Fix Grub2
# sudo sh -c "echo "GRUB_GFXMODE=3840x2160x24,auto" >> /etc/default/grub"
# sudo grub-mkconfig -o /boot/grub/grub.cfg

# Services
# systemctl --user start spotifyd.service
# systemctl --user enable spotifyd.service
sudo systemctl start systemd-timesyncd
sudo systemctl enable systemd-timesyncd

# Shares
sudo mkdir -p /mnt/work/{home,buo,portimaprod,portimaqual,spotlight}
sudo mkdir -p /mnt/NAS/{media,photos}
#sudo mount.cifs -o username=intamv\\700320 //fci.fortis/amv/buo /mnt/work/buo
#sudo mount -t cifs -o username=intamv\\700320 //fci.fortis/acidfs01/brulthome/700320 /mnt/work/home
sudo mkdir -p /mnt/storage
sudo sh -c 'echo "UUID=$(lsblk -no UUID /dev/sdb1)      /mnt/storage        $(lsblk -no FSTYPE /dev/sdb1)       defaults,noatime    0 2" >> /etc/fstab'

# Synology NAS
#192.168.0.203:/volume1/photo 	/mnt/NAS/photos 	nfs 	nouser,rsize=8192,wsize=8192,atime,auto,rw,dev,exec,suid 	0 0
#192.168.0.203:/volume1/video 	/mnt/NAS/video 		nfs 	nouser,rsize=8192,wsize=8192,atime,auto,rw,dev,exec,suid 	0 0

# pull it down
# mkdir -p ~/Projects/dotties && cd ~/Projects/dotties
# git clone https://github.com/moonwitch/dotties.git && rm -rf ~/Projects/dotties/.git
# git submodule init
# git submodele update

# stow it
stow -Rv settings themes
stow -Rv i3
