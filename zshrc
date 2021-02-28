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
# export TERM=screen-256color

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
export PATH="$HOME/.bin:$HOME/.local/bin:$GOBIN:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# export PATH=$PATH:$HOME/code/flutter/bin

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

if [ "$(uname 2> /dev/null)" = "Linux" ]; then
  source /usr/share/chruby/chruby.sh
  source /usr/share/chruby/auto.sh
  source /usr/share/nvm/init-nvm.sh
  # eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
else
  eval "$(rbenv init -)"
  export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi

export DENO_INSTALL="/Users/randuin/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/randuin/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/randuin/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/randuin/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/randuin/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
