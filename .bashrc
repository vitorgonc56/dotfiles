#
# ~/.bashrc
#

# if running interactively, don't do anything
[[ $- != *i* ]] && return

# remove this shit of ctrl+s
stty -ixon

# vi mode
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

# history management
export HISTCONTROL=ignoreboth:erasedups
HISTSIZE= HISTFILESIZE=

# nvim is my man (literally)
export EDITOR="nvim"
export VISUAL="nvim"
export MANPAGER="nvim -c 'set ft=man' -"

# nobody ever saw something like this!!1!
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\w\[$(tput setaf 1)\]]\n\[$(tput setaf 15)\]--\$ \[$(tput sgr0)\]"

# case-insensitive completion
bind "set completion-ignore-case on"

# ls
alias ls="exa -la --group-directories-first --color=auto"
alias la="exa -a --group-directories-first --color=auto"
alias l="exa --group-directories-first --color=auto"

# find replace
alias find="fd"

# cd
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."

# grep replace
alias grep="rg --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

# clipboard to qrcode
alias qrclipb="xclip -selection clipboard -o | qrencode -o - -t PNG | feh -g 600x600 -Z -"

# pacman aliases
alias pacman="doas pacman --color auto"
alias pm="doas pacman --color auto"

# freshfetch > ff
alias ff="freshfetch -a blackarch"

# self explanatory
alias userlist="cut -d: -f1 /etc/passwd"

# wget continues if it was stopped
alias wget="wget -c"

# update font cache
alias update-fc="doas fc-cache -fv"

# clear orphan packages
alias clearorphan="doas pacman -Rns $(pacman -Qtdq)"

# verbose + ask me
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv"

# my config files
alias brc="$EDITOR ~/.bashrc"
alias nurl="$EDITOR ~/.config/newsboat/urls"
alias emir="doas $EDITOR /etc/pacman.d/mirrorlist"
alias pmconf="doas $EDITOR /etc/pacman.conf"
alias qtc="$EDITOR $HOME/.config/qtile/config.py"
alias vimrc="$EDITOR ~/.config/nvim/init.vim"

# git alias
alias dotfiles="/usr/bin/git --git-dir=$HOME/docs/dotfiles.git/ --work-tree=$HOME"
alias g="git"
alias gs="git status"
alias gc="git commit -m"
alias gch="git checkout"
alias gpl="git pull"
alias gps="git push"

# reboot and shutdown
alias pw="poweroff"
alias rb="doas reboot"

# nvim is my friend (and my man)
alias vim="nvim"
alias v="nvim"
alias sv="sudo nvim"

# irssi clutters my home!
alias irssi="irssi --config="$XDG_CONFIG_HOME"/irssi/config --home="$XDG_DATA_HOME"/irssi"

# copy things to clipboard so that my clipboard actually works
alias xclip="xclip -selection clipboard"

# yess openbsd!
alias sudo=doas

shopt -s cmdhist # save multi-line commands in history as single line
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases

freshfetch -a blackarch
