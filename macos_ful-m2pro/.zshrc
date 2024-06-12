# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"

# oh-my-zsh
ZSH_THEME="half-life"

plugins=(
    git
    zsh-interactive-cd
    history
    zsh-autosuggestions
)
## Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

# alias
alias hs="history | grep"
alias ls="ls -lhap --color=auto"
alias applyconfig="source $HOME/.zshrc"

## ブランチを簡単切り替え。git checkout lbで実行できる
alias -g lb='`git branch | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'

## dockerコンテナに入る。deで実行できる
alias de='docker exec -it $(docker ps | peco | cut -d " " -f 1) /bin/bash'


# git repository switch
alias gs='cd $(ghq root)/$(ghq list | peco)'

# peco settings
## 過去に実行したコマンドを選択
function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history

## search a destination from cdr list
function peco-get-destination-from-cdr() {
  cdr -l | \
  sed -e 's/^[[:digit:]]*[[:blank:]]*//' | \
  peco --query "$LBUFFER"
}

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm use 20


# zsh theme config
export LSCOLORS="gxfxcxdxbxegedabagacad"

source ~/.oh-my-zsh/themes/headline.zsh-theme

HEADLINE_USER_PREFIX=' '
HEADLINE_HOST_PREFIX='  '
HEADLINE_PATH_PREFIX=' '
HEADLINE_BRANCH_PREFIX=' '
HEADLINE_USER_TO_HOST=' at '
HEADLINE_HOST_TO_PATH=' in '
HEADLINE_PATH_TO_BRANCH=' on '
HEADLINE_PAD_TO_BRANCH=' on '
HEADLINE_BRANCH_TO_STATUS=' ('
HEADLINE_STATUS_TO_STATUS='|'
HEADLINE_STATUS_END=')'
HEADLINE_LINE_MODE=off
HEADLINE_DO_GIT_STATUS_COUNTS=true
HEADLINE_DO_ERR=true

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
