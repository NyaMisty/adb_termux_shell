#!/system/bin/sh

ROOT="/sdcard/adb_termux_shell"

export TERMUX="/data/data/com.termux"
TERMUX_ID=$(ls -dn $TERMUX | cut -d' ' -f3 | cut -b2-5) # like 0257


TARGET_SETUIDGID=/data/local/tmp/gosetuidgid
if ! [ -f $TARGET_SETUIDGID ]; then
    cp $ROOT/gosetuidgid $TARGET_SETUIDGID
    chmod +x $TARGET_SETUIDGID
    su -c chmod 755 /system/bin /system/xbin
    su -c chmod 777 /data/local /data/local/tmp
fi

# Termux's sgid 1$ID(u0_aXXX),2$ID(u0_aXXX_cache),5$ID(all_aXXX),3003(inet),9997(everybody)
# Shell's sgid: 2000(shell),1004(input),1007(log),1011(adb),1015(sdcard_rw),1028(sdcard_r),3001(net_bt_admin),3002(net_bt),3003(inet),3006(net_bw_stats),3009(readproc),3011(uhid)
su -c "/data/local/tmp/gosetuidgid 1$TERMUX_ID 1$TERMUX_ID,2$TERMUX_ID,5$TERMUX_ID,3003,9997,2000,1004,1007,1011,1015,1028,3001,3002,3006,3009,3011 sh $ROOT/termux.sh"
