session_root "~/Documents/Projects/luca-martella/aspen-wp-plugin-2/"
if initialize_session "aspen-fe"; then
	new_window "aspen-fe-window"
	split_v 50
	split_h
	select_pane 1
	select_pane 0
fi

finalize_and_go_to_session
