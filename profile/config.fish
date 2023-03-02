if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias cl=clear
alias ls='ls --color=auto'
alias ra=ranger
alias l='ls -l'
alias ll='ls -la'
alias vi=nvim

function ProxyOn
    set -xg ALL_PROXY http://localhost:7890
end

function TouchpadOff
	 	xinput set-prop "SYNA3255:00 06CB:7F28 Touchpad" "Device Enabled" 0
	 	echo 'Successful';
end

function TouchpadOn
	 	xinput set-prop "SYNA3255:00 06CB:7F28 Touchpad" "Device Enabled" 1
	 	echo 'Successful';
end

function KeyBoardOff
	 	xinput set-prop "AT Translated Set 2 keyboard" "Device Enabled" 0
	 	echo 'Successful';
end

function KeyBoardOn
	 	xinput set-prop "AT Translated Set 2 keyboard" "Device Enabled" 1
	 	echo 'Successful';
end
