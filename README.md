# winedog
A bash helper script for installing archived games, specifically Fitgirl Repacks

# Disclaimer
I do not condone piracy. This script exists to help people install games that are abandoned and no longer accessible. If you find a game you like, and you are able to purchase it, do that. Developers deserve your support.

# General Info
The current verison of this script is intended for arch-based systems (any system that uses pacman).
I wrote this because I'm not a big fan of using lutris, and I have had some issues installing fitgirl repacks on the latest version of wine.
This is also the first script I've ever really written for other people to use, so if something doesn't work, feel free let me know. 

All this script really does is download an earlier wine package to workaround the current issues with Fitgirl Repacks on wine-10. 
Then it makes a new wine prefix, runs the setup.exe, then optionally runs winetricks.

# Dependencies 
sudo pacman -S --needed wine winetricks curl tar zstd

# How to Use
1. Download the script from this repo
2. Copy the script to the directory of the game you want to install. (Where the setup.exe is located)
3. Ensure the script is set to be executable. (chmod +x winedog-fit.sh)
4. Open a terminal inside the game installer directory.
5. run the script: ./winedog-fit.sh
6. Follow the instructions in your terminal.

Winedog will drop a script called runner.sh in your game files. Run or edit this script to control launch options.


