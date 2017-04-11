# zmodload zsh/zprof
export DOTFILES="$HOME/.dotfiles"
export PROJECTS="$HOME/code"

# Set default to neovim
export EDITOR="nvim"
alias vi="nvim"

DISABLE_AUTO_TITLE=true
DISABLE_UPDATE_PROMPT=true
export LSCOLORS='exfxcxdxbxegedabagacad'
export CLICOLOR=true

# source <(antibody init)
# antibody bundle < ~/.config/antibody/bundles

source ~/.bundles
# railstags() {
#   ctags -R  --exclude=.git --exclude=log --exclude=node_modules --exclude=vendor --exclude=tmp --exclude=db --exclude=coverage --extra=+q . $(bundle list --paths)
# }

railstags() {
  ctags -R  --exclude=.git --exclude=log --exclude=node_modules --exclude=vendor --exclude=tmp --exclude=db --exclude=coverage --extra=+q
}

export PATH=$PATH:$(yarn global bin)

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/share/google-cloud-sdk/path.zsh.inc' ]; then source '/usr/local/share/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/share/google-cloud-sdk/completion.zsh.inc' ]; then source '/usr/local/share/google-cloud-sdk/completion.zsh.inc'; fi

source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/fzf.zsh
source ~/.config/zsh/git.zsh
source ~/.config/zsh/keybindings.zsh
