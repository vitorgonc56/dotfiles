#
# ~/.bashrc
#

[[ $- != *i* ]] && return

set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

export HISTCONTROL=ignoreboth:erasedups

export EDITOR="nvim"
export VISUAL="nvim"
export MANPAGER="nvim -c 'set ft=man' -"

export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\w\[$(tput setaf 1)\]]\n\[$(tput setaf 15)\]--\$ \[$(tput sgr0)\]"

export PATH=$PATH:$HOME/.local/bin:$HOME/.local/share/bin:$HOME/docs/scripts/

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export RXVT_SOCKET="$XDG_RUNTIME_DIR"/urxvtd
export CARGO_HOME="$XDG_DATA_HOME"/cargo

export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default

bind "set completion-ignore-case on"

alias ls="exa -la --group-directories-first --color=auto"
alias la="exa -a --color=auto"
alias l="exa --color=auto"

alias find="fd"

alias ..="cd .."
alias ...="cd ../.."

alias grep="rg --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

alias qrclipb="xclip -selection clipboard -o | qrencode -o - -t PNG | feh -g 600x600 -Z -"
alias diskf="df -h | grep -i sda3"

alias update="doas pacman -Syyu --color auto"
alias pacman="doas pacman --color auto"
alias pm="doas pacman --color auto"

alias userlist="cut -d: -f1 /etc/passwd"

alias wget="wget -c"

alias update-fc="doas fc-cache -fv"

alias clearorphan="doas pacman -Rns $(pacman -Qtdq)"

alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv"

alias nb="$EDITOR ~/.bashrc"
alias nnix="doas $EDITOR /etc/nixos/configuration.nix"
alias nnews="$EDITOR ~/.config/newsboat/urls"
alias nconfgrub="doas $EDITOR /boot/grub/grub.cfg"
alias nfstab="doas $EDITOR /etc/fstab"
alias nmirrorlist="doas $EDITOR /etc/pacman.d/mirrorlist"
alias npacman="doas $EDITOR /etc/pacman.conf"
alias nqtile="$EDITOR $HOME/.config/qtile/config.py"
alias nQtile="$EDITOR $HOME/.config/qtile/config.py"
alias nsamba="doas $EDITOR /etc/samba/smb.conf"
alias nvimrc="$EDITOR ~/.config/nvim/init.vim"

alias dotfiles="/usr/bin/git --git-dir=$HOME/docs/dotfiles.git/ --work-tree=$HOME"
alias g="git"
alias gs="git status"
alias gc="git commit -m"
alias gch="git checkout"
alias gpl="git pull"
alias gps="git push"

alias ssn="doas shutdown now"
alias sr="doas reboot"

alias vim="nvim"

alias xclip="xclip -selection clipboard"

alias sudo=doas

shopt -s cmdhist # Save multi-line commands in history as single line
shopt -s histappend # Do not overwrite history
shopt -s expand_aliases # Expand aliases

# Easy file extractor
ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

freshfetch
