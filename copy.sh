rm -rf ~/dotfile/.config/
mkdir -p ~/dotfile/.config/tmux/
mkdir -p ~/dotfile/.config/nvim/
cp ~/.tmux.conf .
cd ~/.config/tmux/
rsync -lvr --exclude=.git --exclude=.DS_Store --exclude=plugins ./ ~/dotfile/.config/tmux/
cd ~/.config/nvim/
rsync -lvr --exclude=.git --exclude=.DS_Store ./ ~/dotfile/.config/nvim/
