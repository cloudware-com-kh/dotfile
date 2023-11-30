rm -rf ~/dotfile/.config/
mkdir -p ~/dotfile/.config/tmux/
mkdir -p ~/dotfile/.config/nvim/
mkdir -p ~/dotfile/.config/tmuxifier/layouts/
cp ~/.tmux.conf .
cd ~/.config/nvim/
rsync -lvr --exclude=.git --exclude=.DS_Store ./ ~/dotfile/.config/nvim/
cd ~/.config/tmux/
rsync -lvr --exclude=.git --exclude=.DS_Store --exclude=plugins ./ ~/dotfile/.config/tmux/
cd ~/.config/nvim/
cd ~/.tmuxifier/layouts/
rsync -lvr --exclude=.DS_Store --exclude=.git ./ ~/dotfile/.config/tmuxifier/layouts/
