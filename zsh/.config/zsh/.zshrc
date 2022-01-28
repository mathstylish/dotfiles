#!/bin/sh

export ZDOTDIR=$HOME/.config/zsh
HISTFILE=~/.zsh_history
setopt appendhistory                                      # Append history to the history file (no overwriting)
setopt sharehistory                                       # Share history across terminals
setopt incappendhistory                                   # Immediately append to the history file, not just when a term is killed

# Some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef                                           # disable ctrl-s to freeze terminal
zle_highlight=('paste: none')

# beeping is annoying
unsetopt BEEP

# completions
zstyle ':completion:*' menuselect
zmodload zsh/complist
# compinit
_comp_options+=(globdots)                                 # include hidden files

# if you press up or down during a part of a command, only the commands that start with that part will be shown
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# colors
autoload -Uz colors && colors

# useful functions
source "$ZDOTDIR/zsh-functions"

# normal files to source
zsh_add_file "zsh-exports"
zsh_add_file "zsh-prompt"
zsh_add_file "zsh-aliases"
# zsh_add_file "zsh-vim-mode"

# help me with commands
zsh_add_file "zsh-cmd-usages"

# plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "zsh-users/zsh-completions"
zsh_add_plugin "hlissner/zsh-autopair"

# load compinit for working completions
autoload -Uz compinit && compinit
