# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(
    git
    zsh-interactive-cd
    history
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

## BUN
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

## PNPM
export PNPM_HOME="$HOME/.local/share/pnpm"
if ! echo "$PATH" | grep -q "$PNPM_HOME"; then
  export PATH="$PNPM_HOME:$PATH"
fi

## Aliases
alias hs="history | grep"
alias ls="ls -lhap --color=auto"
alias applyconfig="source $HOME/.zshrc"

alias gs='cd $(ghq root)/$(ghq list | peco)'

## GHQ + PECO

# peco settings
# 過去に実行したコマンドを選択
function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history

# search a destination from cdr list
function peco-get-destination-from-cdr() {
  cdr -l | \
  sed -e 's/^[[:digit:]]*[[:blank:]]*//' | \
  peco --query "$LBUFFER"
}

# 過去に移動したことのあるディレクトリを選択。ctrl-uにバインド
function peco-cdr() {
  local destination="$(peco-get-destination-from-cdr)"
  if [ -n "$destination" ]; then
    BUFFER="cd $destination"
    zle accept-line
else  
    zle reset-prompt
  fi
}
zle -N peco-cdr


# ブランチを簡単切り替え。git checkout lbで実行できる
alias -g lb='`git branch | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'

# dockerコンテナに入る。deで実行できる
alias de='docker exec -it $(docker ps | peco | cut -d " " -f 1) /bin/bash'

export LSCOLORS="gxfxcxdxbxegedabagacad"

# NVM
source /usr/share/nvm/init-nvm.sh
# bun completions
[ -s "/home/krtm/.bun/_bun" ] && source "/home/krtm/.bun/_bun"

eval "$(starship init zsh)"
export LANG=en_US