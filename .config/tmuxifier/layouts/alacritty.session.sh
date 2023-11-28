session_root "~/.config/alacritty/"
if initialize_session "alacritty"; then
	new_window "alacritty-window"
fi

finalize_and_go_to_session
