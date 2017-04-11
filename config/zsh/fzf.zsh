_gen_fzf_default_opts() {
  local color00='#000000'
  local color01='#303030'
  local color02='#505050'
  local color03='#b0b0b0'
  local color04='#d0d0d0'
  local color05='#e0e0e0'
  local color06='#f5f5f5'
  local color07='#ffffff'
  local color08='#fb0120'
  local color09='#fc6d24'
  local color0A='#fda331'
  local color0B='#a1c659'
  local color0C='#76c7b7'
  local color0D='#6fb3d2'
  local color0E='#d381c3'
  local color0F='#be643c'

  export FZF_DEFAULT_OPTS="
    --ansi
    --extended
    --bind ctrl-f:page-down,ctrl-b:page-up
    --height 40% --border
    --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
    --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
    --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
  "
  export FZF_DEFAULT_COMMAND='ag -l -g ""'
}
_gen_fzf_default_opts
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export ENHANCD_FILTER="fzf"

fe() {
  local file
  file=$(fzf --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}
