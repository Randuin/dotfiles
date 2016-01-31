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

antigen bundle brew
antigen bundle brew-cask
antigen bundle gem
antigen bundle osx
antigen-bundle b4b4r07/enhancd

antigen bundle bundler

antigen theme miloshadzic
antigen-apply

export PATH=~/.bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
# alias railstags="ripper-tags -R --exclude=.git --exclude=log --exclude=node_modules --exclude=vendor --exclude=tmp --exclude=db --exclude=coverage *"

# railstags() {
#   ctags -R  --exclude=.git --exclude=log --exclude=node_modules --exclude=vendor --exclude=tmp --exclude=db --exclude=coverage --extra=+q . $(bundle list --paths)
# }

railstags() {
  ripper-tags -R  --exclude=.git --exclude=log --exclude=node_modules --exclude=vendor --exclude=tmp --exclude=db --exclude=coverage --extra=+q . $(bundle list --paths)
}

alias be="bundle exec"
alias vi="nvim"
alias grrh='git reset --hard origin/$(current_branch)'
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
chruby 2.2.3
source /usr/local/opt/chruby/share/chruby/auto.sh

export DOCKER_HOST=tcp://192.168.59.103:2375
export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_DEFAULT_OPTS='
  --ansi
  --extended
  --bind ctrl-f:page-down,ctrl-b:page-up
  --color fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104
  --color info:183,prompt:110,spinner:107,pointer:167,marker:215
'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fe() {
  local file
  file=$(fzf --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

fbd() {
  local branches branch
  branches=$(git branch) &&
  branch=$(echo "$branches" | fzf +m) &&
  gb -D $(echo "$branch" | sed "s/.* //")
}

fbdd() {
  local branches branch
  branches=$(git branch) &&
  branch=$(echo "$branches" | fzf +m) &&
  gp origin :$(echo "$branch" | sed "s/.* //") &&
  gb -D $(echo "$branch" | sed "s/.* //")
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
# [[ -f /usr/local/bin/docker-machine ]] && eval "$(docker-machine env local)"
