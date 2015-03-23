ZSH=$HOME/.oh-my-zsh
ZSH_THEME="sorin"
DISABLE_AUTO_TITLE="true"
plugins=(git osx ruby rails)
source $ZSH/oh-my-zsh.sh

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias railstags="ctags -R --exclude=.git --exclude=log *"
alias be="bundle exec"
alias vi="nvim"

export EDITOR="nvim"

# export CC=/usr/local/bin/gcc-4.2
# export CC=gcc
# export CPPFLAGS=-I/opt/X11/include
# export CXX=g++
# export CFLAGS=-Wno-error=shorten-64-to-32
export RUBYOPT=-rrubygems
# export RUBY_CONFIGURE_OPTS=--with-readline-dir="$(brew --prefix readline)"
# export CONFIGURE_OPTS=--with-openssl-dir=`brew --prefix openssl`
export RUBY_GC_MALLOC_LIMIT=8000000
export RUBY_GC_HEAP_INIT_SLOTS=10000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1,8
export RUBY_HEAP_SLOTS_INCREMENT=1
# export GOPATH="$HOME/Projects/Go"
# export GOBIN="$GOPATH/bin"
# export PATH="$GOBIN:$PATH"

BASE16_SCHEME="tomorrow.dark"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

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

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
[[ -s ~/.gvm/scripts/gvm ]] && source ~/.gvm/scripts/gvm
