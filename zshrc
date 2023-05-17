export GOPATH=$HOME/code/go
export GOSRC=$HOME/code/go/src
export GOBIN=$HOME/code/go/bin
# export GOPATH=$HOME
export PATH=$HOME/.bin:$HOME/.local/bin:/opt/homebrew/bin:$GOBIN:$PATH
export OPENSSL_CFLAGS=-Wno-error=implicit-function-declaration

# if [[ ! -f ~/.zpm/zpm.zsh ]]; then
#   git clone --recursive https://github.com/zpm-zsh/zpm ~/.zpm
# fi
# source ~/.zpm/zpm.zsh

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# zmodload zsh/zprof
export DOTFILES="$HOME/.dotfiles"
export PROJECTS="$HOME/code"

# Set default to neovim
export EDITOR="nvim"
alias vi="nvim"
alias xclip="xclip -selection c"
alias dc="docker-compose"
alias ls='exa --git --icons --color=always --group-directories-first'
alias cd='z'

DISABLE_AUTO_TITLE=true
DISABLE_UPDATE_PROMPT=true
# export LSCOLORS='exfxcxdxbxegedabagacad'
export CLICOLOR=true
export CARGO_NET_GIT_FETCH_WITH_CLI=true
# export NODE_OPTIONS=--openssl-legacy-provider
# export TERM=screen-256color

# source <(antibody init)
# antibody bundle < ~/.config/antibody/bundles



source $DOTFILES/config/zsh/aliases.zsh
# source $DOTFILES/config/zsh/fzf.zsh
# source $DOTFILES/config/zsh/git.zsh
# source $DOTFILES/config/zsh/keybindings.zsh

# source $HOME/.bundles
# railstags() {
#   ctags -R  --exclude=.git --exclude=log --exclude=node_modules --exclude=vendor --exclude=tmp --exclude=db --exclude=coverage --extra=+q . $(bundle list --paths)
# }

# export PATH=$PATH:$HOME/code/flutter/bin

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local


# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

if [ "$(uname 2> /dev/null)" = "Linux" ]; then
  # source /usr/share/chruby/chruby.sh
  # source /usr/share/chruby/auto.sh
  # source /usr/share/nvm/init-nvm.sh
  # eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  . /opt/asdf-vm/asdf.sh
else
  # export PATH="/opt/homebrew/bin:$PATH"
  # echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc
  . $(brew --prefix asdf)/libexec/asdf.sh
  # . /opt/homebrew/opt/asdf/libexec/asdf.sh
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/randuin/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/randuin/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/randuin/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/randuin/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="$PATH:/Users/randuin/.local/bin"

