# Zsh configuration (BSD Unix)
# created by jpjenk

#===================================
# Antigen Configuration
#===================================

if [ `uname -n` = "teststrata.geology.wisc.edu" ]; then
    source /Users/jpjenk/repos/antigen/bin/antigen.zsh
else
    source /usr/local/share/antigen/antigen.zsh
fi

## Load the oh-my-zsh library
antigen use oh-my-zsh

## Framework bundles 
antigen bundle perl
antigen bundle git
antigen bundle python
antigen bundle pip
# antigen bundle atom
# antigen bundle z
antigen bundle node
# antigen bundle command-not-found
# antigen bundle autojump
# antigen bundle common-aliases
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh
antigen bundle zsh-users/zsh-completions

## OS specific bundles
antigen bundle osx
antigen bundle brew

## Load a theme
antigen theme robbyrussell

## Close Antigen calls
antigen apply


#===================================
# Terminal Vi Mode Configuration
#===================================

## Set Vi modal keymappings
bindkey -v

## Built-in defaults:
##   <esc> vi-cmd-mode
##   '^['  vi-cmd-mode
##   '^j'  return
##   'i'   vi-insert-mode
##   '^l'  clear-screen
bindkey '^N' down-history
bindkey '^h' backward-delete-char
bindkey '^o' backward-kill-word
bindkey '^P' up-history
bindkey '^r' history-incremental-search-backward

## Vi command mode prompt
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[red]%} [% VISUAL MODE]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1


#===================================
# Search Paths
#===================================

## By default the following directories are in the path:
## /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

# Additions to /usr/local toolchain and userland
export PATH=/usr/local/sbin:$PATH
export MANPATH=/usr/local/share/man:$MANPATH

# Package management utilities for PyPy
# export PATH=$PATH:/usr/local/share/pypy3

# Global NPM modules
export NODE_PATH=/usr/local/lib/node_modules

# YarraRiver scripts and software
export PATH=$PATH:~jpjenk/bin

# Root path for Go lang
export PATH=$PATH:/usr/local/opt/go/libexec/bin

#===================================
# Additional Shell Configuration
#===================================

# Additional environment variables
export HOMEBREW_GITHUB_API_TOKEN="ace007b9c2b85f0ad7b92629996632df7613340e"
export HOMEBREW_NO_EMOJI=1
export HOMEBREW_NO_ANALYTICS=1

export EDITOR=vim
export VISUAL=vim

# Load custom shell aliases
source ~/.alias

# iTerm2 shell integration. Also enables imgcat and it2dl.
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Correct previous console command
eval $(thefuck --alias)

# function search() {
    # open /Applications/Safari.app/ "$1";
# }
