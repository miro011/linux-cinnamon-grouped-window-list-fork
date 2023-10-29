#!/bin/bash

# Back up the original
origDir="/usr/share/cinnamon/applets/grouped-window-list@cinnamon.org"
disabledDir="/usr/share/cinnamon/applets/disabled/grouped-window-list@cinnamon.org"

if [ -d "$disabledDir" ]; then
    if [ -d "$origDir" ]; then
        sudo rm -r "$origDir"
    fi
    sudo cp -r "$disabledDir" "$origDir"
    sudo rm -r "$disabledDir"
fi

# Copy the altered extension
alteredDir="/home/$USER/.local/share/cinnamon/applets/grouped-window-list@cinnamon.org"

if [ -d "$targetDir" ]; then
    rm -r "$targetDir"
fi

echo "UNINSTALL COMPLETE. LOGOUT OR RESTART CINNAMON TO APPLY. PRESS ENTER TO CLOSE"
read hold