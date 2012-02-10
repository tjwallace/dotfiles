# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="bira"

DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(brew bundler gem git rbenv)

source $ZSH/oh-my-zsh.sh

# homebrew only
[[ `uname` == "Darwin" ]] && export PATH=/usr/local/bin:$PATH

alias ll='ls -lh'
alias l='ls -lah'
alias b='bundle exec'
alias brake='bundle exec rake'

# Ctrl+left/right
bindkey '5D' emacs-backward-word
bindkey '5C' emacs-forward-word

# use most as pager if available
if which most > /dev/null; then
  export PAGER=most
fi

export EDITOR=vim

# history search up and down
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

# tweaks for ruby
export RUBY_HEAP_MIN_SLOTS=500000
export RUBY_HEAP_SLOTS_INCREMENT=250000
export RUBY_GC_MALLOC_LIMIT=50000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1

# RVM
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
