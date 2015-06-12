# ZSH=$HOME/.oh-my-zsh
# ZSH_THEME="miloshadzic"
DISABLE_AUTO_TITLE="true"
# plugins=(git osx ruby rails)
# source $ZSH/oh-my-zsh.sh
source "$HOME/.antigen/antigen.zsh"

antigen bundle robbyrussell/oh-my-zsh lib/

antigen bundle git
antigen bundle tmux
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle rupa/z

antigen bundle brew
antigen bundle brew-cask
antigen bundle gem
antigen bundle osx

antigen bundle bundler

antigen theme miloshadzic
antigen-apply

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias railstags="ripper-tags -R --exclude=.git --exclude=log --exclude=node_modules --exclude=vendor --exclude=tmp --exclude=db --exclude=coverage *"
alias be="bundle exec"
alias vi="nvim"
export EDITOR="nvim"

export RUBYOPT=-rrubygems
export RUBY_GC_MALLOC_LIMIT=8000000
export RUBY_GC_HEAP_INIT_SLOTS=10000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1,8
export RUBY_HEAP_SLOTS_INCREMENT=1
export NVIM_TUI_ENABLE_TRUE_COLOR=1

BASE16_SCHEME="bright.dark"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

export DOCKER_HOST=tcp://192.168.59.103:2375
export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_DEFAULT_OPTIONS='--ansi'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fe() {
  local file
  file=$(fzf --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

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
