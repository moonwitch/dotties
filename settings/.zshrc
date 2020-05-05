# If you come from bash you might have to change your $PATH.
[ -d /home/linuxbrew/.linuxbrew ] && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

export ZHOME="$HOME"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.zsh_custom"

ZSH_THEME="bullet-train"
# ZSH_THEME="oxide"

BULLETTRAIN_PROMPT_ORDER=(
  git
  context
  dir
  time
)

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Plugins
#plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Aliasses
alias g="git"

PATH="/home/kelly/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/kelly/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/kelly/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/kelly/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/kelly/perl5"; export PERL_MM_OPT;
