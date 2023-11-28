session_root "~/.config/tmux/"
if initialize_session "tmux"; then
	new_window "tmux-window"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
