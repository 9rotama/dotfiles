cd "$(dirname "$0")" || exit 
SCRIPT_DIR=$(pwd)

ln -fs $SCRIPT_DIR/.zshrc $HOME/.zshrc 
ln -fs $SCRIPT_DIR/.wezterm.lua $HOME/.wezterm.lua
ln -fs $SCRIPT_DIR/.config/starship.toml $HOME/.config/starship.toml
