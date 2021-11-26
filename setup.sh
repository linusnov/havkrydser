#!/bin/sh

#-_-_-_-_-_-_-_-_-_-_-_-_-_-_
green="\e[0;32m\033[1m"
end="\033[0m\e[0m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
purple="\e[0;35m\033[1m"
turquoise="\e[0;36m\033[1m"
gray="\e[0;37m\033[1m"
#-_-_-_-_-_-_-_-_-_-_-_-_-_-_

# funtions

trap ctrl_c INT

function ctrl_c(){
	clear; echo -e "${red}You have stopped the script${end}"
	exit 1
}

function dependencies(){
	tput civis
	dependencies=(bspwm sxhkd picom lxappearance pcmanfm nitrogen opera toilet)

	echo -e "${blue}[${end}${red}!${end}${blue}]${end}${yellow} Checking dependencies${end}"
	sleep 2

	for program in "${dependencies[@]}"; do
		echo -ne "\t${yellow}dependencie $program${end}"
		test -f /sbin/$program

		if [ "$(echo $?)" == "0" ]; then
			echo -e "${green}(+)${end}"
		else
			echo -e "${red}(x)${red}"
			sudo pacman -S $program --noconfirm
		fi; sleep 1
	done
}

if [ "$(id -u)" == "0" ]; then
	toilet -f pagga dotfiles | lolcat -a
	echo -e "install configuration >> i"
	read -p "[dotfiles@console]>> " ch

	if [ $ch = i ]; then
		echo ""
	elif [ $ch = u ]; then
		echo ""
	else
		echo ""
	fi

else
	echo -e "\n\t${red}You need root user${end}\n\t"
fi
