# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme

ZH_THEME="thibz"

# Case-sensitive completion

CASE_SENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd-mm-yyyy"

# Plugins

plugins=(
git
docker
docker-compose
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Dotted/hidden files in tab-completions

setopt globdots

# Aliases

if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS - requires: brew install coreutils
    alias ll='LC_COLLATE=C gls -alhF --color=auto --group-directories-first'
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # WSL / Linux - native GNU ls already supports these flags
    alias ll='LC_COLLATE=C ls -alhF --color=auto --group-directories-first'
fi

alias zshconf="nano ~/.zshrc"
alias applyconf="source ~/.zshrc && source ~/.oh-my-zsh/themes/thibz.zsh-theme"
alias venv="source .venv/bin/activate"

source $ZSH/themes/thibz.zsh-theme

. "$HOME/.local/bin/env"
