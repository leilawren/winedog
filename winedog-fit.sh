#! /bin/bash

#COLORS
BLUE="\e[36m"
GREEN="\e[32m"
RED="\e[31m"
PINK="\e[95m"
RESET="\e[0m"

echo "   / \__"
echo "  (    @\___"
echo "  /         O"
echo " /   (_____/	    bark!!!"
echo "/_____/   U"

# Welcome
echo -e "${BLUE}Hello, I'm Winedog, I'm here to help you install archived games${RESET}"
echo -e "${PINK}This is the FIT fork, for Firgirl Repacks${RESET}"
echo -e "${GREEN}REMINDER: This script should be run from inside your repack folder, where setup.exe is located.${RESET}"
sleep 8
echo -e "${BLUE}Where should winedog install your game? (provide the full path):${RESET}"
echo -e "${PINK}Example: /home/<user>/Games/<installed-repack>/${RESET}"
read pfxdir

# Make new prefix and install
echo -e "${BLUE}Okay, making a new wine prefix directory...${RESET}"
echo -e "${GREEN}A Wine Config window will appear. Just click OK${RESET}"
sleep 5
mkdir -p $pfxdir
WINEPREFIX=$pfxdir winecfg
echo -e "${GREEN}Configuration complete!${RESET}"

# Winetricks
echo -e "${BLUE}Running a basic winetricks setup...${RESET}"
sleep 3
WINEPREFIX=$pfxdir winetricks -q cmd corefonts dxvk

# Wine-9.0 puller script
curl -o wine-9.0.pkg.tar.zst https://archive.archlinux.org/packages/w/wine/wine-9.0-1-x86_64.pkg.tar.zst
mkdir wine-9.0/
tar --zstd -xvf wine-9.0.pkg.tar.zst -C wine-9.0/

# Game install
echo -e "${GREEN}INSTRUCTIONS!!${RESET}"
sleep 2
echo -e "${BLUE}The Fitgirl installer will run.${RESET}"
echo -e "${GREEN}A wine-mono waring will appear. Click CANCEL <3${RESET}"
sleep 8
echo -e "${BLUE}Be sure to install to the C: drive${RESET}"
echo -e "${PINK}Example: C:\<name-of-game>${RESET}"
sleep 8
echo -e "${BLUE}Do not update DirectX, DotNet4.0, etc...${RESET}"
echo -e "${BLUE}Do not launch the game through the installer when complete${RESET}"
sleep 8
WINEPREFIX=$pfxdir wine-9.0/usr/bin/wine setup.exe

# Complete, optional winetricks
echo -e "${BLUE}If all went well, your game has been installed.${RESET}"
echo -e "${BLUE}Try launching it through the desktop shortcut${RESET}"
echo -e "${BLUE}You can also launch it through the game directory .exe${RESET}"
echo -e "${BLUE}If your game doesn't launch, you may need to install a missing winetricks component.${RESET}"
echo -e "${GREEN}Would you like to install additional winetricks components now? (yes/no): ${RESET}"
read choice 
if [ "$choice" = "yes" ]; then
    echo -e "${BLUE}Okay! Running winetricks GUI${RESET}"
    sleep 2
    echo -e "${GREEN}INSTRUCTIONS:${RESET}"
    echo -e "${BLUE}Select the default prefix${RESET}"
    echo -e "${BLUE}Select "Install a windows dll or component"${RESET}"
    echo -e "${BLUE}Choose your components and select OKAY ${RESET}"
    echo -e "${BLUE}Click Cancel, then Cancel again to close winetricks${RESET}"
    sleep 10
    WINEPREFIX=$pfxdir winetricks -q
elif [ "$choice" = "no" ]; then
    echo -e "${PINK}Winedog loves you.${RESET}"
    exit
else 
	echo -e "${RED}ERROR: uhh.. what? (case matters)${RESET}"
fi