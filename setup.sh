cd "$(dirname "$0")" || exit 
SCRIPT_DIR=$(pwd)

ln -fs $SCRIPT_DIR/config/.zshrc $HOME/.config/.zshrc
ln -fs $SCRIPT_DIR/config/starship.toml $HOME/.config/starship.toml
ln -fs $SCRIPT_DIR/config/alacritty/alacritty.toml $HOME/.config/alacritty/alacritty.toml
ln -fs $SCRIPT_DIR/config/alacritty/catppuccin-mocha.toml $HOME/.config/alacritty/catppuccin-mocha.toml
ln -fs $SCRIPT_DIR/discorduwu.sh $HOME/discorduwu.sh

echo "setup dotfiles completed"
