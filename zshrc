export POWERLEVEL9K_INSTANT_PROMPT=quiet
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export GOPATH=$HOME/code/go
export GOSRC=$HOME/code/go/src
export GOBIN=$HOME/code/go/bin
# export GOPATH=$HOME
export PATH=/opt/homebrew/bin:$GOBIN:$PATH
export OPENSSL_CFLAGS=-Wno-error=implicit-function-declaration

# if [[ ! -f ~/.zpm/zpm.zsh ]]; then
#   git clone --recursive https://github.com/zpm-zsh/zpm ~/.zpm
# fi
# source ~/.zpm/zpm.zsh
source ~/.zplug/init.zsh
zplug "zsh-users/zsh-history-substring-search"
zplug "junegunn/fzf", \
    from:gh-r, \
    as:command, \
    use:"*darwin*amd64*"

zplug "zpm-zsh/fast-syntax-highlighting", defer:2
zplug "zpm-zsh/ls"
zplug "zpm-zsh/colorize"
zplug "mdumitru/git-aliases"

zplug romkatv/powerlevel10k, as:theme, depth:1
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
source <(afx init)

# zmodload zsh/zprof
export DOTFILES="$HOME/.dotfiles"
export PROJECTS="$HOME/code"

# Set default to neovim
export EDITOR="nvim"
alias vi="nvim"
alias xclip="xclip -selection c"
alias dc="docker-compose"

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
