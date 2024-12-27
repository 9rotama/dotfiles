export LANG=en_US.UTF-8

# omz
export ZSH="$HOME/.oh-my-zsh"

plugins=(
	git
	autojump
	urltools
	bgnotify
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# aliases
alias hs="history | grep"
alias ls="lsd -lha --color=auto"
alias lst="lsd -lha --tree --color=auto"
alias lstc="lsd --tree --color=auto --icon=never"
alias gs='cd $(ghq root)/$(ghq list | peco)'
alias discorduwu="~/discorduwu.sh"

# starship
eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
if ! echo "$PATH" | grep -q "$PNPM_HOME"; then
  	export PATH="$PNPM_HOME:$PATH"
fi

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# asdf
. /opt/asdf-vm/asdf.sh
