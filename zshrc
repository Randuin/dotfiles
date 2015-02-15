ZSH=$HOME/.oh-my-zsh

ZSH_THEME="sorin"
alias railstags="ctags -R --exclude=.git --exclude=log *"
alias be="bundle exec"
alias vi="vim"
export EDITOR="vim"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"
plugins=(git osx ruby rails git-extras)
source $ZSH/oh-my-zsh.sh
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# export CC=/usr/local/bin/gcc-4.2
# export CC=gcc
# export CPPFLAGS=-I/opt/X11/include
# export CXX=g++
# export CFLAGS=-Wno-error=shorten-64-to-32
export RUBYOPT=-rrubygems
# export RUBY_CONFIGURE_OPTS=--with-readline-dir="$(brew --prefix readline)"
# export CONFIGURE_OPTS=--with-openssl-dir=`brew --prefix openssl`

export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

export RUBY_GC_MALLOC_LIMIT=8000000
export RUBY_GC_HEAP_INIT_SLOTS=10000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1,8
export RUBY_HEAP_SLOTS_INCREMENT=1
export GOPATH="$HOME/Projects/Go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"

BASE16_SCHEME="tomorrow.dark"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

eval "$(rbenv init -)"

export DOCKER_HOST=tcp://192.168.59.103:2375
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fe() {
  local file
  file=$(fzf --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

export FZF_DEFAULT_COMMAND='ag -l -g ""'

fbr() {
  local branches branch
  branches=$(git branch) &&
    branch=$(echo "$branches" | fzf +s +m) &&
    git checkout $(echo "$branch" | sed "s/.* //")
}

ftags() {
  local line
  [ -e tags ] &&
    line=$(
  awk 'BEGIN { FS="\t" } !/^!/ {print toupper($4)"\t"$1"\t"$2"\t"$3}' tags |
  cut -c1-80 | fzf --nth=1,2
  ) && $EDITOR $(cut -f3 <<< "$line") -c "set nocst" \
    -c "silent tag $(cut -f2 <<< "$line")"
}
