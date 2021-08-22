#!/usr/bin/env bash

# Install script for i3 + polybar 

# Dirs
DIR=`pwd`
FDIR="$HOME/.local/share/fonts"
PDIR="$HOME/.config/polybar"
IDIR="$HOME/.config/i3"

# Install Fonts
install_fonts() {
	echo -e "\n[*] Installing fonts..."
	if [[ -d "$FDIR" ]]; then
		cp -rf $DIR/fonts/* "$FDIR"
	else
		mkdir -p "$FDIR"
		cp -rf $DIR/fonts/* "$FDIR"
	fi
}

# Install Theme
install_theme() {
	if [[ -d "$PDIR" ]]; then
		echo -e "[*] Creating a backup of your polybar configs..."
		mv "$PDIR" "${PDIR}.old"
		{ mkdir -p "$PDIR"; cp -rf $DIR/polybar/* "$PDIR"; }
	else
		{ mkdir -p "$PDIR"; cp -rf $DIR/polybar/* "$PDIR"; }	
	fi
	if [[ -f "$PDIR/launch.sh" ]]; then
		echo -e "[*] Successfully Installed.\n"
	else
		echo -e "[!] Failed to install.\n"
		exit 1
	fi
}

# Install i3 config
install_i3() {
	if [[ -d "$IDIR" ]]; then
		echo -e "[*] Creating a backup of your polybar configs..."
		mv "$IDIR" "${IDIR}.old"
		{ mkdir -p "$IDIR"; cp -rf $DIR/i3/* "$IDIR"; }
	else
		{ mkdir -p "$IDIR"; cp -rf $DIR/i3/* "$IDIR"; }	
	fi
	if [[ -f "$IDIR/config" ]]; then
		echo -e "[*] Successfully Installed.\n"
	else
		echo -e "[!] Failed to install.\n"
		exit 1
	fi
}


# Main
main() {
	clear
	cat <<- EOF
		[*] Installing Polybar Theme...
	EOF

	install_fonts
	install_theme
	install_i3

	cat <<- EOF
		[*] Copying vim and zsh RC files...
	EOF
	
	cp $DIR/.vimrc ~/.vimrc
	cp $DIR/.zshrc ~/.zshrc
	
	exit 0 
}

main
