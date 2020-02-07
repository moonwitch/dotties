#!/bin/bash

baph --install --noview --noconfirm \ #baph -inN
pamac-aur \
nerd-fonts-fantasque-sans-mono \
python-pip \
spotifyd-full \
xautolock \
numlockx \
dbus \
mpris-ctl \
playerctl \
openconnect-networkmanager \

# Install e-id stuff; this is Belgian users only

baph --install --noview --noconfirm ccid pcsclite eid-mw acsccid
sudo systemctl enable pcscd.socket 
sudo systemctl start pcscd.socket 
killall chromium && modutil -dbdir sql:.pki/nssdb/ -add "Belgium eID" -libfile /usr/lib/libbeidpkcs11.so


# Install neovim plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

pip3 install --user neovim

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

curl -L https://raw.githubusercontent.com/dikiaap/dotfiles/master/.oh-my-zsh/themes/oxide.zsh-theme > $HOME/.oh-my-zsh/themes/oxide.zsh-theme

# Requirements for Polybar scripts
pip install --upgrade oauth2client google-api-python-client

#Install lightdm looker
pacman -S lightdm-webkit-theme-litarvan

#Install Icon themes after cloning them
git clone https://github.com/horst3180/arc-icon-theme --depth 1
mv arc-icon-theme/Arc ~/.icons

#Fix Grub2
echo "GRUB_GFXMODE=1920x1080x32" >> /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Generate my ssh key for github/bitbucket
ssh-keygen -t rsa -b 4096 -C "kelly.crabbe@gmail.com" 

# Get one more theme
wget -qO- https://git.io/papirus-icon-theme-install | DESTDIR="$HOME/.icons" sh

# Services
systemctl --user start spotifyd.service
systemctl --user enable spotifyd.service

sudo mkdir -p /mnt/work/{home,buo,portimaprod,portimaqual,spotlight} 
sudo mount.cifs -o username=intamv\\700320 //fci.fortis/amv/buo /mnt/work/buo
sudo mount -t cifs -o username=intamv\\700320 //fci.fortis/acidfs01/brulthome/700320 /mnt/work/home
