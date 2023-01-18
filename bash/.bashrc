#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W \h] [\! \#]$ '
set -o vi
xmodmap -e "clear lock" -e "keycode 0x42 = Escape"
[ -n "$XTERM_VERSION" ] && transset-df --id "$WINDOWID" >/dev/null

