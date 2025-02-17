export GOPATH=$HOME/.go
export GOSRC=$HOME/code/go/src
export GOBIN=$GOPATH/bin
export PATH=$HOME/.bin:$HOME/.local/bin:/opt/homebrew/bin:$GOBIN:$PATH
export OPENSSL_CFLAGS=-Wno-error=implicit-function-declaration
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(sheldon source)"

export DOTFILES="$HOME/.dotfiles"
export PROJECTS="$HOME/code"

# Set default to neovim
export EDITOR="nvim"
alias vi="nvim"
alias xclip="xclip -selection c"
alias dc="docker-compose"
alias ls='eza --git --icons --color=always --group-directories-first'
alias cd='z'
alias lg='lazygit'
alias cs='cursor'
alias ws='windsurf'
alias tf='terraform'

DISABLE_AUTO_TITLE=true
DISABLE_UPDATE_PROMPT=true
# export LSCOLORS='exfxcxdxbxegedabagacad'
export CLICOLOR=true
export CARGO_NET_GIT_FETCH_WITH_CLI=true

source $DOTFILES/config/zsh/aliases.zsh
# source $DOTFILES/config/zsh/git.zsh
# source $DOTFILES/config/zsh/fzf.zsh
# source $DOTFILES/config/zsh/keybindings.zsh

# source $HOME/.bundles
# railstags() {
#   ctags -R  --exclude=.git --exclude=log --exclude=node_modules --exclude=vendor --exclude=tmp --exclude=db --exclude=coverage --extra=+q . $(bundle list --paths)
# }

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

if [ "$(uname 2> /dev/null)" = "Linux" ]; then
  . /opt/asdf-vm/asdf.sh
else
  # . $(brew --prefix asdf)/libexec/asdf.sh
  eval "$(/Users/randuin/.local/bin/mise activate zsh)"
fi

export PATH="$PATH:$HOME/.local/bin"


# Shopify Hydrogen alias to local projects
# alias h2='$(npm prefix -s)/node_modules/.bin/shopify hydrogen'

# autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /opt/homebrew/bin/terraform terraform
export PATH="/Users/randuin/.pixi/bin:$PATH"
