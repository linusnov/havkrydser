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
	dependencies=(bspwm sxhkd xorg picom lxappearance pcmanfm nitrogen firefox toilet lolcat)

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

function polybar_script(){
	tput civis
	dependencies=(polybar)
	
	echo -e  "${blue}[${end}${red}!${end}${blue}]${end}${yellow} Checking Polybar test${end}"
	sleep 2

	for program in "${dependencies[@]}"; do
		echo -ne "\t${yellow}dependencies $program${end}"
	        test -f /sbin/$program

		if [ "$(echo $?)" == "0" ]; then
			echo -e "${green}(+)${end}"
		else
			echo -e "${red}(x)${end}"
			yay -S $program --noconfirm
		fi; sleep 	

	done
}

function lazyvim(){
  tput civis
  dependencies=(neovim)

  echo -e "${green}(!) Searching dependencies ${end}"
  sleep 2

  for program in "${dependencies[@]}"; do 
      echo -ne "\t opening in sbin... ${red}$program${end}"
        test -f /sbin/$program;
    if [ "$(echo $?)" == "0" ]; then
      echo -e "${green}Installed${end}"
    else
      echo -e "${red}Non-installed${end}"
      sudo pacman -S $program;
    fi
  done 

}

if [ "$(id -u)" == "1000" ]; then
	dependencies; clear
	toilet -f pagga dotfiles | lolcat -a
	echo -e "1) install configuration"
	echo -e "2) install polybar"
	read -p "[dotfiles@console]>> " ch

	if [ $ch = i ]; then
		mkdir $HOME/.config/bspwm; mkdir $HOME/.config/sxhkd;
		cp -r configs/bspwmrc $HOME/.config/bspwm; cp -r configs/sxhkdrc $HOME/.config/sxhkd;

		clear; toilet -f smascii12 Done | lolcat -a
	elif [ $ch = 2 ]; then
		polybar_script
    git clone --depth=1 https://github.com/adi1090x/polybar-themes.git;
    cd polybar-themes; ./setup.sh;
  elif [ $ch = 3 ]; then
    lazyvim
	else
		echo ""
	fi

else
	echo -e "\n\t${red}You need normal user${end}\n\t"
fi
