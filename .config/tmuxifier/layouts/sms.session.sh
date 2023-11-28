# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/Documents/GitHub/cloudware-com-kh/sms/"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "sms"; then
	new_window "sms-window"
	split_v 50
	split_h 66
	split_h
	select_pane 1
	select_pane 0
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
