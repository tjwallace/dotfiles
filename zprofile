# GC tuning for ruby
export RUBY_GC_MALLOC_LIMIT=60000000
export RUBY_FREE_MIN=200000

# chef
export OPSCODE_USER=jwallace_pp
export OPSCODE_ORGNAME=partnerpedia

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
