# Set Greetings
set -g -x fish_greeting 'Welcome home!'

# Ensure my aliases are loaded
source .aliases

# Prompt!
starship init fish | source
