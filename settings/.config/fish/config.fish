# Set Greetings
set -g -x fish_greeting 'Welcome home!'

# Ensure I've got aliases
if test -e ~/.aliases
  source ~/.aliases
end

# NPM with no sudo
set NPM_PACKAGES "$HOME/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"

# Prompt!
starship init fish | source

