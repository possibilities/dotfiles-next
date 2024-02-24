#!/bin/bash

# Get the ID of the focused window
focused_window_id=$(herbstclient attr clients.focus.winid)

# Get a list of all window IDs
window_ids=$(herbstclient list | grep -oP '0x[0-9a-fA-F]+')

# Close all windows except for the focused one
for window_id in $window_ids; do
    if [ "$window_id" != "$focused_window_id" ]; then
        herbstclient close "$window_id"
    fi
done

