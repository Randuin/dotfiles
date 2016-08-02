DISABLE_AUTO_TITLE="true"
source ~/.zplug/init.zsh

export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_DEFAULT_OPTS='
  --ansi
  --extended
  --bind ctrl-f:page-down,ctrl-b:page-up
  --color fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104
  --color info:183,prompt:110,spinner:107,pointer:167,marker:215
'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "plugins/git",   from:oh-my-zsh, if:"(( $+commands[git] ))", nice:11
zplug "plugins/tmux",   from:oh-my-zsh, nice:11
zplug "plugins/osx",   from:oh-my-zsh, nice:11

export ENHANCD_FILTER="fzf"
zplug "b4b4r07/enhancd", use:"init.sh"

zplug "nojhan/liquidprompt"

zplug "zsh-users/zsh-completions", nice:11
zplug "zsh-users/zsh-syntax-highlighting", nice:11

zplug load

[[ $- = *i* ]] && source ~/.zplug/repos/nojhan/liquidprompt/liquidprompt

alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

railstags() {
  ctags -R  --exclude=.git --exclude=log --exclude=node_modules --exclude=vendor --exclude=tmp --exclude=db --exclude=coverage --extra=+q . $(bundle list --paths)
}

alias be="bundle exec"
alias bs="brew services"
alias vi="nvim"
alias grrh='git reset --hard origin/$(current_branch)'
export EDITOR="nvim"

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
chruby 2.3.1

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
