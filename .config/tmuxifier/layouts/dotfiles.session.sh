session_root "~/dotfile/"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "dotfiles"; then
	new_window "dotfile-window"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
