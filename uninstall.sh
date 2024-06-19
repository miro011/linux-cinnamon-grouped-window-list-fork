#!/bin/bash

# Restore the original
origDir="/usr/share/cinnamon/applets/grouped-window-list@cinnamon.org"
disabledDir="/usr/share/cinnamon/applets/disabled/grouped-window-list@cinnamon.org"

if [ -d "$disabledDir" ]; then
    if [ -d "$origDir" ]; then
        sudo rm -r "$origDir"
    fi
    sudo cp -r "$disabledDir" "$origDir"
    sudo rm -r "$disabledDir"

    echo "UNINSTALL COMPLETE. LOGOUT OR RESTART CINNAMON TO APPLY."
    echo "PRESS ENTER TO CLOSE"
    read hold
else
    echo "NOTHING TO UNINSTALL"
    echo "PRESS ENTER TO CLOSE"
    read hold
fi
