  # omz
export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  autojump
  urltools
  bgnotify
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-history-enquirer
)

source $ZSH/oh-my-zsh.sh

# aliases
alias hs="history | grep"
alias ls="lsd -lha --color=auto"
alias lst="lsd -lha --tree --color=auto"
alias lstc="lsd --tree --color=auto --icon=never"
alias gs='cd $(ghq root)/$(ghq list | peco)'

## enter "git checkout lb" / switch branch
alias -g lb='`git branch | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'

## enter "de" / containers
alias de='docker exec -it $(docker ps | peco | cut -d " " -f 1) /bin/bash'

# starship
eval "$(starship init zsh)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
if ! echo "$PATH" | grep -q "$PNPM_HOME"; then
  export PATH="$PNPM_HOME:$PATH"
fi

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# other
export LANG=en_US.UTF-8

# asdf
. /opt/asdf-vm/asdf.sh


