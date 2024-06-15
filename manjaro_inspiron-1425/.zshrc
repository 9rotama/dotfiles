# omz
export ZSH="$HOME/.oh-my-zsh"

plugins=(
    git
    zsh-interactive-cd
    history
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh



## Aliases
alias hs="history | grep"
alias ls="ls -lhap --color=auto"
alias applyconfig="source $HOME/.zshrc"
alias gs='cd $(ghq root)/$(ghq list | peco)'



# enter "git checkout lb" / switch branch
alias -g lb='`git branch | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'




# enter "de" / containers
alias de='docker exec -it $(docker ps | peco | cut -d " " -f 1) /bin/bash'




# nvm
source /usr/share/nvm/init-nvm.sh




# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
if ! echo "$PATH" | grep -q "$PNPM_HOME"; then
  export PATH="$PNPM_HOME:$PATH"
fi




# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "/home/krtm/.bun/_bun" ] && source "/home/krtm/.bun/_bun"





# ls color prompt
export LSCOLORS="gxfxcxdxbxegedabagacad"



# starship
eval "$(starship init zsh)"


# other
export LANG=en_US