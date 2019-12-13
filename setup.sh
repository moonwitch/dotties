#Getting my default openers right, and allowing older apps to work as well
ln -s ~/.config/mimeapps.list ~/.local/share/applications/mimeapps.list

# Install neovim plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip3 install --user neovim

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install more packages
pacman -S stow archiso archuseriso python-pywal 

easy_install Pygments

# Grab Theme
/home/kelly/orw/themes/icons
