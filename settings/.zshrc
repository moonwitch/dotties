# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

export ZHOME="$HOME"
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.zsh_custom"

DISABLE_MAGIC_FUNCTIONS=true
COMPLETION_WAITING_DOTS="true"

##
# Completion
##
autoload -U compinit && compinit
setopt completealiases          # complete alisases
setopt always_to_end            # when completing from the middle of a word, move the cursor to the end of the word    
setopt complete_in_word         # allow completion from within a word/phrase
setopt correct                  # spelling correction for commands
setopt list_ambiguous           # complete as much of a completion until it gets ambiguous.

# Plugins
plugins=(zsh-autosuggestions jira zsh-history-substring-search fast-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Perl Additions
PATH="/home/kelly/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/kelly/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/kelly/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/kelly/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/kelly/perl5"; export PERL_MM_OPT;

# Functions
get_recipe() { 
  curl -sG "https://plainoldrecipe.com/recipe" -d "url=${1}" | pandoc -f html -t markdown 
}

# Ensure I've got aliases
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

# zsh parameter completion for the dotnet CLI
_dotnet_zsh_complete()
{
  local completions=("$(dotnet complete "$words")")
  reply=( "${(ps:\n:)completions}" )
}

compctl -K _dotnet_zsh_complete dotnet
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/kelly/.sdkman"
[[ -s "/home/kelly/.sdkman/bin/sdkman-init.sh" ]] && source "/home/kelly/.sdkman/bin/sdkman-init.sh"

eval "$(starship init zsh)"

# NPM with no sudo
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# Because I can't find the bastard
unalias rd
