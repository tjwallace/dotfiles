# Include local config first
[ -s ~/.zshrc.local ] && source ~/.zshrc.local

# 1Password
[ -s ~/.config/op/plugins.sh ] && source ~/.config/op/plugins.sh

# homebrew
if type brew &> /dev/null; then
  export PATH=/usr/local/sbin:/usr/local/bin:$PATH

  # completions
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
  autoload -Uz compinit
  compinit

  # python
  export PATH=/opt/homebrew/opt/python@3.11/libexec/bin:$PATH
  export PATH=/Users/jeff/Library/Python/3.9/bin:$PATH
fi

# rbenv
if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

# direnv
if which direnv > /dev/null; then
  eval "$(direnv hook zsh)"
fi

# go
export GOPATH=$HOME/code/go
export PATH=$GOPATH/bin:$PATH

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="dstufft"

DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=()

source $ZSH/oh-my-zsh.sh

# disable autocorrect
unsetopt correct_all

alias ll='ls -lh'
alias l='ls -lah'
alias bi='bundle install && bundle binstubs --all --path .bundle/bin'

# use most as pager if available
if which most > /dev/null; then
  export PAGER=most
fi

export EDITOR=vim

# ctrl+left/right
bindkey '5D' emacs-backward-word
bindkey '5C' emacs-forward-word

# history search up and down
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

# alias hub to git
if which hub > /dev/null; then
  eval "$(hub alias -s)"
fi

# fzf options
export FZF_DEFAULT_OPTS="--history=$HOME/.fzf_history"

# kubectl completion
if which kubectl > /dev/null; then
  source <(kubectl completion zsh)
fi
