# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/chyx/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


export EDITOR=/usr/bin/nvim
#命令别名 {{{
alias -g ls='ls -F --color=auto'
alias -g ll='ls -la'
alias -g grep='grep --color=auto'
alias -g ra='ranger'

alias ra=ranger
alias ls='ls --color=auto'
alias ll='ls -la'

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

source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# 启用彩色提示符
autoload -U colors && colors

# 每次刷新提示符
setopt prompt_subst

#设定git branch
# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%F{1}(%b)%f'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST

# 设置提示符
PROMPT='
%F{26}# %F{45}%n%f @ %F{41}%m %F{222}%~%f ${vcs_info_msg_0_}
%F{160}$ '

bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
