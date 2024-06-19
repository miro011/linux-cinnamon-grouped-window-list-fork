#!/bin/bash

# Back up the original
origDir="/usr/share/cinnamon/applets/grouped-window-list@cinnamon.org"
disabledDir="/usr/share/cinnamon/applets/disabled/grouped-window-list@cinnamon.org"

# If a disabled dir already exists, it means it was already backed up, so no need to back up (plus it would result in backing up the altered version)
if [ -d "$origDir" ] && ! [ -d "$disabledDir" ]; then
    sudo mkdir -p "/usr/share/cinnamon/applets/disabled"
    sudo cp -r "$origDir" "$disabledDir"
    sudo rm -r "$origDir"
fi

# Copy the altered extension
targetDir="/home/$USER/.local/share/cinnamon/applets/grouped-window-list@cinnamon.org"
if [ -d "$targetDir" ]; then
    rm -r "$targetDir"
fi
scriptFolderDir=$(dirname "$0")
cp -r "$scriptFolderDir/grouped-window-list@cinnamon.org" "/home/$USER/.local/share/cinnamon/applets/grouped-window-list@cinnamon.org"

echo "INSTALL COMPLETE. LOGOUT OR RESTART CINNAMON TO APPLY."
echo "PRESS ENTER TO CLOSE"
read hold
