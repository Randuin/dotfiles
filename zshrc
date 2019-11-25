# zmodload zsh/zprof
export DOTFILES="$HOME/.dotfiles"
export PROJECTS="$HOME/code"

# Set default to neovim
export EDITOR="nvim"
alias vi="nvim"
alias xclip="xclip -selection c"

DISABLE_AUTO_TITLE=true
DISABLE_UPDATE_PROMPT=true
export LSCOLORS='exfxcxdxbxegedabagacad'
export CLICOLOR=true

source <(antibody init)
antibody bundle < ~/.config/antibody/bundles

source $DOTFILES/config/zsh/aliases.zsh
source $DOTFILES/config/zsh/fzf.zsh
source $DOTFILES/config/zsh/git.zsh
source $DOTFILES/config/zsh/keybindings.zsh

# source $HOME/.bundles
# railstags() {
#   ctags -R  --exclude=.git --exclude=log --exclude=node_modules --exclude=vendor --exclude=tmp --exclude=db --exclude=coverage --extra=+q . $(bundle list --paths)
# }

railstags() {
  ctags -R  --exclude=.git --exclude=log --exclude=node_modules --exclude=vendor --exclude=tmp --exclude=db --exclude=coverage --extra=+q
}

export GOPATH=$HOME/code/go
export GOBIN=$HOME/code/go/bin
export PATH="$HOME/.bin:$HOME/.local/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# export PATH=$PATH:$(yarn global bin):$GOBIN
# export PATH=$PATH:$HOME/code/flutter/bin

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/share/google-cloud-sdk/path.zsh.inc' ]; then source '/usr/local/share/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/share/google-cloud-sdk/completion.zsh.inc' ]; then source '/usr/local/share/google-cloud-sdk/completion.zsh.inc'; fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
eval "$(rbenv init -)"
