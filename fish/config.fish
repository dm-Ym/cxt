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

