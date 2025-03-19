#!/bin/sh

#userresources=$HOME/.Xresources
#usermodmap=$HOME/.Xmodmap
#sysresources=/etc/X11/xinit/.Xresources
#sysmodmap=/etc/X11/xinit/.Xmodmap
export XSESSION_PID="$$"

export PATH=$PATH:$HOME/.local/bin
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export EDITOR=vim
export TERMINAL=st
export VISUAL=vim
export ZDOTDIR=$HOME/.config/zsh
# merge in defaults and keymaps

#if [ -f $sysresources ]; then
#    xrdb -merge $sysresources
#fi
#
#if [ -f $sysmodmap ]; then
#    xmodmap $sysmodmap
#fi
#
#if [ -f "$userresources" ]; then
#    xrdb -merge "$userresources"
#fi
#
#if [ -f "$usermodmap" ]; then
#    xmodmap "$usermodmap"
#fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xrandr -s 3840x2160
#picom -b --config /home/cliff/.config/picom/picom.conf &
#start-conky.sh &
#redshift -l 40.26257:-80.18728 &
#/usr/bin/dunst &
#/home/cliff/.fehbg &
feh --bg-fill --randomize ~/Pictures/wallpapers/* &
#locked &
dwmblocks &


while true; do
    dwm >/dev/null 2>&1
done    

exec dwm 
#exec /usr/bin/i3 --shmlog-size=26214400
