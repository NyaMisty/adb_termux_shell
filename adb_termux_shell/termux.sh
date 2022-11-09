#!/system/bin/sh
#Based on https://github.com/termux/termux-app/issues/77
#Based on https://gist.github.com/rewida17/f8564bee5a196a8f51b98cd2e53813e4

export TERMUX="/data/data/com.termux"

SELINUX_LEVEL=$(ls -dZ $TERMUX | cut -d' ' -f1 | cut -d: -f5)
echo -n "u:r:magisk:s0:$SELINUX_LEVEL" > /proc/self/attr/current

# add a xbin folder to allow some system command not overrided
export PATH="/data/data/com.termux/files/usr/xbin:/data/data/com.termux/files/usr/bin:/data/data/com.termux/files/usr/bin/applets:$PATH"
export SHELL="/data/data/com.termux/files/usr/bin/zsh"
export TERM="xterm-256color"
export LANG="en_US.UTF-8"

export LD_PRELOAD="/data/data/com.termux/files/usr/lib/libtermux-exec.so"
export HOME="/data/data/com.termux/files/home"
export PREFIX="/data/data/com.termux/files/usr"
export TMPDIR="/data/data/com.termux/files/usr/tmp"1~

#export LD_LIBRARY_PATH='/data/data/com.termux/files/usr/lib'
export COLORTERM="truecolor"
export HISTCONTROL="ignoreboth"

eval $(resize)
#cd "$HOME"
cd /sdcard
exec "$SHELL" -l
