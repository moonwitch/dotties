#!/bin/bash
#baph --install --noview --noconfirm
baph -inN pamac-aur \
nerd-fonts-fantasque-sans-mono nerd-fonts-fira-code nerd-fonts-fira-mono nerd-fonts-jetbrains-mono \
python-pip \
spotifyd-full \
xautolock numlockx \
zathura neofetch \
dbus \
playerctl \
openconnect-networkmanager \
chromium \
rawtherapee \
pidgin \
exiftool \
mattermost-desktop-bin \
stow \
conky \
synology-cloud-station-drive \
gtk-engine-murrine \
/

# Install e-id stuff; this is Belgian users only
baph -inN ccid pcsclite eid-mw acsccid
sudo systemctl enable pcscd.socket
sudo systemctl start pcscd.socket
modutil -dbdir sql:.pki/nssdb/ -add "Belgium eID" -libfile /usr/lib/libbeidpkcs11.so

# Install neovim plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip3 install --user neovim

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mkdir $HOME/.zsh_custom
curl -L https://raw.githubusercontent.com/dikiaap/dotfiles/master/.oh-my-zsh/themes/oxide.zsh-theme > $HOME/.zsh_custom/oxide.zsh-theme

# Get ZoomVideo
wget https://www.zoom.us/client/latest/zoom_x86_64.pkg.tar.xz

# Requirements for Polybar scripts
pip install --upgrade oauth2client google-api-python-client

#Install lightdm looker
baph -inN lightdm-webkit-theme-litarvan

#Install themes after cloning them
git clone https://github.com/horst3180/arc-icon-theme --depth 1 ~/.icons/ArcSrc
mv ~/.icons/ArcSrc/Arc ~/.icons/Arc
rm -rf ~/.icons/ArcSrc
git clone https://github.com/zayronxio/Zafiro-icons --depth 1 ~/.icons/zafiro
git clone https://github.com/heychrisd/Boston-Icons --depth 1 ~/.icons/boston-icons
git clone https://github.com/horst3180/arc-theme

#Fix Grub2
echo "GRUB_GFXMODE=1920x1080x32" >> /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Generate my ssh key for github/bitbucket
ssh-keygen -t rsa -b 4096 -C "kelly.crabbe@gmail.com"

# Services
systemctl --user start spotifyd.service
systemctl --user enable spotifyd.service

#sudo mkdir -p /mnt/work/{home,buo,portimaprod,portimaqual,spotlight}
#sudo mount.cifs -o username=intamv\\700320 //fci.fortis/amv/buo /mnt/work/buo
#sudo mount -t cifs -o username=intamv\\700320 //fci.fortis/acidfs01/brulthome/700320 /mnt/work/home
