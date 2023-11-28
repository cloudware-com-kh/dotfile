session_root "~/Documents/GitHub/cloudware-com-kh/css_umbrella/"
if initialize_session "css_umbrella"; then
	new_window "css_umbrella-window"
	split_v 50
	split_h
	select_pane 1
	select_pane 0
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
