session_root "~/.local/share/nvim/lazy/LazyVim/"
if initialize_session "lazyvim"; then
	new_window "lazyvim-window"
fi
finalize_and_go_to_session
