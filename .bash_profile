#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# $PATH variable
export PATH=$PATH:$HOME/.local/bin:$HOME/.local/share/bin:$HOME/docs/scripts/

# xdg thing because xdg-user-dirs suck!!
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# don't clutter my home
export RXVT_SOCKET="$XDG_RUNTIME_DIR"/urxvtd
export CARGO_HOME="$XDG_DATA_HOME"/cargo

export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default

export LESSHISTFILE=-
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey

export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass

export WGETRC="$XDG_CONFIG_HOME/wgetrc"

export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

if [ "$(tty)" = "/dev/tty1" ]; then
    pgrep -x qtile || exec startx
fi
