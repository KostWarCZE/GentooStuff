# cat /home/kreyren/.bashrc
# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can not tolerate any output.  So make sure this does not display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Put your fun stuff here
## Data under this comment are licenced under GPLv2 (https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html) for github.com/kreyren ##

## FUCK integration
eval $(thefuck --alias fu)

## Setxkbmap integration
change_keyboard_layout () {
	if [[ -x $(command -v setxkbmap) ]]; then
		if [[ $(setxkbmap -print | grep -o "pc+us") == "pc+us" ]]; then
			setxkbmap cz

		elif [[ $(setxkbmap -print | grep -o "pc+cz") == "pc+cz" ]]; then
				setxkbmap us
		fi

		else
			echo "ERROR: Command setxkbmap is not executable."
	fi
}

# Notes
## PathName = Directories+Files

# Mingdao made this, it sents stuff to remote stuff on URL stuff things
ix ()
{
    curl -n -F 'f:1=<-' http://ix.io
}

# Scaling
if [[ $(xrandr | grep -o "HDMI-A-0 connected primary 5760x3240") == "HDMI-A-0 connected primary 5760x3240" ]]; then
	export GDK_SCALE=2
	export GDK_DPI_SCALE=0.8
fi

export GDK_SCALE=2
export GDK_DPI_SCALE=0.8

# Export vars
export PHOENICIS_DIR="/home/$USER/GIT/kreyrenicis"
#export JAVA_HOME="/usr/lib64/openjdk-11"
#export JAVA_HOME="/opt/openjdk-bin-11.0.2_p7"
export JAVA_HOME=""
export PHOENICIS_SCRIPT_DIR="/usr/phoenicis/scripts"
export TEAMSPEAK3DIR="/opt/TeamSpeak3"
export FUNTOO_DIR="/mnt/funtoo"
#export DISPLAY=":0" # Should be default VAR for Xorg?
export PATH="$HOME/bin:$PATH"
# CHrooterOfKreys integration
export GENTOO_CHROOT="/dev/sdb6"
export LFS_CHROOT="/dev/sdb4"
export CFLAGS="-O2 -march=sandybridge -pipe" # Optimization for `make`
export GPGID="werifgx@gmail.com" # Sign compiled sources
export LC_ALL="en_US.UTF-8" # Set locales
export BROWSER="firefox"
PATH="$PATH:$HOME/.local/bin"

# Custom commands
## Copy Path Name
### Supperior to cp since it shows additional info about copy + -r is same.
alias cpn="rsync --info=progress2"
## Move Path Name
alias mpn="mv"
## Edit Path name stub
alias refresh="source /home/$USER/.bashrc"
alias update="update --full-update"
alias emerge-dev="emerge --ignore-default-opts"
# alias lol-test="sudo rm -r /home/$USER/games/leagueoflegends ; sudo rm -r /var/tmp/portage/games-emulation/leagueoflegends* ; sudo rm -r /opt/games/leagueoflegends ; cd /usr/portage/games-emulation/leagueoflegends/ && ebuild leagueoflegends-4933455.ebuild digest && emerge leagueoflegends"
# alias leagueoflegends="DXVK_STATE_CACHE='/tmp/dishonored' DXVK_HUD='devinfo,fps,frametimes,drawcalls,pipelines,memory,version' WINEDEBUG='-all' WINEPREFIX='/opt/games/leagueoflegends' wine /opt/games/leagueoflegends/drive_c/Riot\ Games/League\ of\ Legends/LeagueClient.exe"
alias xclip="xclip -selection c"

# TEMP: VORGEX INTEGRATION
if [[ -e "/home/kreyren/.local/share/vortex" ]]; then
	alias vortex="env WINEPREFIX='/home/kreyren/.local/share/vortex' wine /home/kreyren/.local/share/vortex/drive_c/Program\ Files/Black\ Tree\ Gaming\ Ltd/Vortex/Vortex.exe"
	echo "FIXME: VORTEX, TEMPORARY!"
fi

# SXIV itegration
if [[ -x "$(command -v sxiv)" ]]; then
	alias im="sxiv" # OpenPictureViewer
fi

# SUDO integration
if [[ -x "$(command -v sudo)" ]]; then
	alias nano="sudo nano"
	alias subl="sudo subl"
	alias dispatch-conf="sudo dispatch-conf"
	alias layman="sudo layman"
	alias mount="sudo mount"
	alias rm="sudo rm"
	# alias atom="sudo atom"
	## Doesn't work as well on root, meant to work on non-root
	alias chroot="sudo chroot"
	alias Qtest="sudo qemu-system-x86_64 -snapshot /dev/sdb"
	alias mount="sudo mount"
	alias umount="sudo umount"
	alias chmod="sudo chmod"
	alias cp="sudo cp"

	## Enoch Merge
	if [[ -x $(command -v emerge) ]]; then
		alias em="sudo emerge" # Enoch Merge
		alias es="sudo emerge --search" # Enoch Search
		alias esync="sudo emerge --sync" # Enoch SYNC
		alias eb="sudo ebuild" # Enoch Build
		alias er="sudo emerge -c" # Enoch Remove
		alias ers="sudo emerge -c" # Enoch Remove Systempackage
		alias emfu="sudo emerge --sync && sudo emerge -uDUj @world"
		alias elip="eix-installed -a" # Enoch List Installed Packages
	fi

	if [[ -x $(command -v gparted) ]]; then
		alias gparted="sudo gparted"
	fi

	if [[ -x $(command -v apt) ]]; then
		alias apt="sudo apt" # Advanced Packaging Tool
		alias aptfu="sudo apt update -y && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y"
		alias apti="sudo apt install -y" # Apt install
		alias apts="sudo apt-cache search" # Apt search
		alias aptr="sudo apt remove -y" # Apt remove
		alias aptar="sudo apt autoremove" # Apt Auto Remove
		alias aptli="sudo apt list --installed"
	fi

	if [[ -x $(command -v dpkg) ]]; then
		alias dpkg="sudo dpkg"
	fi

	if [[ -x $(command -v zypper) ]]; then
		# Zypper = Zen Yast Package Program (ZYPP?)
		# Yast = Yet Another Silly/Setup Thing/Thing
		alias lcp="sudo zypper"
		alias lcpi="sudo zypper install"
		alias lcps="sudo zypper search"
		alias lcpsi="sudo zypper source-install"
		alias lcpr="sudo zypper remove"
		if [[ $(cat /etc/os-release | grep -m 1 -o 'openSUSE Tumbleweed') == "openSUSE Tumbleweed"  ]]; then
			# Zypper update kills the system - LCP
			alias lcpfu="sudo zypper dup"
			# Because Geeko uses sublime3 to call sublime_text instead of something that makes sence like 'subl'..
			alias subl="sudo sublime3"
		fi
	fi

	if [[ -x $(command -v updatedb) ]];then
		alias updatedb="sudo updatedb"
	fi
fi

# WINE integration
if [[ -x "$(command -v wine)" ]]; then

	# WINE-Dishonored2
#	alias winesteam-dishonored2="WINEPREFIX='/home/$USER/.wine-dishonored2' wine /home/$USER/.wine-dishonored2/drive_c/Program\ Files\ \(x86\)/Steam/Steam.exe"
#	alias dishonored2="WINEPREFIX='/home/$USER/.wine-dishonored2' wine /home/$USER/.wine-dishonored2/drive_c/Program\ Files\ \(x86\)/Steam/steamapps/common/dishonoted2/dishonoted2.exe"
#	alias winetricks-dishonored2="WINEPREFIX='/home/$USER/.wine-dishonored2' winetricks"

	# Make wine
	alias makewine64="WINEARCH='win64' WINEPREFIX='/home/$USER/.wine-64' winecfg"
	alias makewine32="WINEARCH='win32' WINEPREFIX='/home/$USER/.wine-32' winecfg"

	# Wine prefix for specific arch
	alias wine64="WINEDEBUG='-all' WINEARCH='win64' WINEPREFIX='/home/$USER/.wine-64' wine"
	alias wine32="WINEDEBUG='-all' WINEARCH='win32' WINEPREFIX='/home/$USER/.wine-32' wine"

	# Wine debug
	alias wine64-debug="WINEDEBUG='+trace' WINEARCH='win64' WINEPREFIX='/home/$USER/.wine-64' wine"
	alias wine64-debug="WINEDEBUG='+trace' WINEARCH='win64' WINEPREFIX='/home/$USER/.wine-64' wine"

	# Winecfg
	alias winecfg64="WINEARCH='win64' WINEPREFIX='/home/$USER/.wine-64' winecfg"
	alias winecfg32="WINEARCH='win32' WINEPREFIX='/home/$USER/.wine-32' winecfg"

	# winedbg
	alias winedbg64="WINEARCH='win64' WINEPREFIX='/home/$USER/.wine-64' winedbg"
	alias winedbg32="WINEARCH='win32' WINEPREFIX='/home/$USER/.wine-32' winedbg"

	if [[ -x /home/$USER/.wine-32/drive_c/Program\ Files/Steam/Steam.exe ]]; then
		alias winesteam64="wine64 /home/$USER/.wine-64/drive_c/Program\ Files\ \(x86\)/Steam/Steam.exe"
	fi

	if [[ -x /home/$USER/.wine-64/drive_c/Program\ Files\ \(x86\)/Steam/Steam.exe ]]; then
			alias winesteam32="wine32 /home/$USER/.wine-64/drive_c/Program\ Files\ \(x86\)/Steam/Steam.exe"
	fi

	if [[ -x /home/$USER/.wine/drive_c/Program\ Files\ \(x86\)/Steam/Steam.exe ]]; then
			alias winesteam="wine /home/$USER/.wine/drive_c/Program\ Files\ \(x86\)/Steam/Steam.exe"
	fi



fi

# WINETRICKS integration
if [[ -x "$(command -v winetricks)" ]]; then
	alias winetricks64="WINEARCH='win64' WINEPREFIX='/home/$USER/.wine-64' winetricks"
	alias winetricks32="WINEARCH='win32' WINEPREFIX='/home/$USER/.wine-32' winetricks"

fi

# WTF GO
export GOROOT=$HOME/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
