#Getting my default openers right, and allowing older apps to work as well
ln -s ~/.config/mimeapps.list ~/.local/share/applications/mimeapps.list

# Install neovim plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip3 install --user neovim
