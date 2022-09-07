#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ra=ranger
alias ll='ls -la'
PS1='[\u@\h \W]\$ '


function ProxyOn(){
	export http_proxy="http://localhost:7890"
	export https_proxy="http://localhost:7890"
}


function TouchpadOn(){
	xinput set-prop "SYNA3255:00 06CB:7F28 Touchpad" "Device Enabled" 1
	echo 'Successful';
}
function TouchpadOff(){
	xinput set-prop "SYNA3255:00 06CB:7F28 Touchpad" "Device Enabled" 0
	echo 'Successful';
}
