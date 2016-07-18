export PATH=~/.bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
BASE16_SCHEME="bright.dark"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

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
zplug "themes/miloshadzic", from:oh-my-zsh
zplug "plugins/git",   from:oh-my-zsh, if:"(( $+commands[git] ))", nice:11
zplug "plugins/colorize", from:oh-my-zsh
zplug "plugins/tmux",   from:oh-my-zsh, nice:11
zplug "plugins/osx",   from:oh-my-zsh, nice:11

export ENHANCD_FILTER="fzf"
zplug "b4b4r07/enhancd", use:"init.sh"
zplug "stedolan/jq", \
    from:gh-r, \
    as:command, \
    rename-to:jq
zplug "b4b4r07/emoji-cli", \
    on:"stedolan/jq"

zplug "zsh-users/zsh-completions", nice:11
zplug "zsh-users/zsh-history-substring-search", nice:11
zplug "zsh-users/zsh-syntax-highlighting", nice:11

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
# alias railstags="ripper-tags -R --exclude=.git --exclude=log --exclude=node_modules --exclude=vendor --exclude=tmp --exclude=db --exclude=coverage *"

railstags() {
  ctags -R  --exclude=.git --exclude=log --exclude=node_modules --exclude=vendor --exclude=tmp --exclude=db --exclude=coverage --extra=+q . $(bundle list --paths)
}

# railstags() {
#   ripper-tags -R  --exclude=.git --exclude=log --exclude=node_modules --exclude=vendor --exclude=tmp --exclude=db --exclude=coverage --extra=+q . $(bundle list --paths)
# }

alias be="bundle exec"
alias vi="nvim"
alias grrh='git reset --hard origin/$(current_branch)'
export EDITOR="nvim"
# export TERM=xterm-256color-italic

export RUBYOPT=-rrubygems
export RUBY_GC_MALLOC_LIMIT=8000000
export RUBY_GC_HEAP_INIT_SLOTS=10000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1,8
export RUBY_HEAP_SLOTS_INCREMENT=1

source /usr/local/opt/chruby/share/chruby/chruby.sh
chruby 2.3.1
source /usr/local/opt/chruby/share/chruby/auto.sh

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
