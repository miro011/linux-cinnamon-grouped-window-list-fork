#!/bin/bash

scriptFolderDir=$(dirname "$0")
moddedDir="$scriptFolderDir/grouped-window-list@cinnamon.org"
if ! [ -d "$moddedDir" ]; then
    echo "You need to copy or move the modded extension folder of the one that matches your Linux Mint version to the folder install.sh is in."
    echo "SCRIPT FAILED, PRESS ENTER TO CLOSE"
    read hold
    exit 1
fi

# Back up the original
origDir="/usr/share/cinnamon/applets/grouped-window-list@cinnamon.org"
disabledDir="/usr/share/cinnamon/applets/disabled/grouped-window-list@cinnamon.org"

if [ -d "$origDir" ]; then
    # If a disabled dir already exists, it means it was already backed up, so no need to back up (plus it would result in backing up the altered version)
    if ! [ -d "$disabledDir" ]; then
        sudo mkdir -p "/usr/share/cinnamon/applets/disabled" > /dev/null 2>&1
        sudo cp -r "$origDir" "$disabledDir"
        sudo rm -r "$origDir"
    fi

    sudo rm -r "$origDir" > /dev/null 2>&1
fi

# Copy the modded extension
sudo cp -r "$moddedDir" "$origDir"
echo "INSTALL COMPLETE. LOGOUT OR RESTART CINNAMON TO APPLY."
echo "PRESS ENTER TO CLOSE"
read hold
