######################
# Copyright (C) 2011 by ZTE
#####################
#!/system/bin/sh

SYSDIR=/data/local
LOGDIR=/data/local/logs
BINDIR=/system/bin

#get real log location
echo LOGDIR=$LOGDIR

#copy anr log
ls /data/anr
case "$?" in
	0) echo "has anr files"
	cd $SYSDIR
	busybox cp -r /data/anr/* $LOGDIR/anr/
;;
esac

# copy tombstones log
ls /data/tombstones
case "$?" in
	0) echo "has tombstones"
	cd $SYSDIR
	busybox cp -r /data/tombstones/tombstone* $LOGDIR/logcat/
;;
esac

dmesg >> $LOGDIR/last_kmsg.txt

dumpstate > $LOGDIR/reset/dumpstate.txt

echo "this file contains the cmd ps and dumpsys meminfo"  > $LOGDIR/reset/sysInfo.txt
echo "******************** ps *****************************************" >> $LOGDIR/reset/sysInfo.txt
ps >> $LOGDIR/reset/sysInfo.txt
echo "******************** dumpsys meminfo ****************************" >> $LOGDIR/reset/sysInfo.txt
dumpsys meminfo >> $LOGDIR/reset/sysInfo.txt

# ZTE_MODIFY fanwuxun/dupucun 2011-11-29 add network command to dump the network information for debug..

echo "************ system network information"  >$LOGDIR/reset/networkInformation.txt
busybox ifconfig >> $LOGDIR/reset/networkInformation.txt
busybox route    >> $LOGDIR/reset/networkInformation.txt
#//更详细的网络接口信息
echo "*****************************************************************"  >>$LOGDIR/reset/networkInformation.txt
ip addr         >> $LOGDIR/reset/networkInformation.txt

#souce 网络路由信息
echo " "  >>$LOGDIR/reset/networkInformation.txt
echo "*****************************************************************"  >>$LOGDIR/reset/networkInformation.txt
echo "************ system network routing tables"  >>$LOGDIR/reset/networkInformation.txt
ip rule list           >> $LOGDIR/reset/networkInformation.txt
ip route show table 1  >> $LOGDIR/reset/networkInformation.txt
ip route show table 2  >> $LOGDIR/reset/networkInformation.txt
ip route show table 3  >> $LOGDIR/reset/networkInformation.txt
ip route show table 4  >> $LOGDIR/reset/networkInformation.txt
ip route show table 5  >> $LOGDIR/reset/networkInformation.txt
ip route show table 6  >> $LOGDIR/reset/networkInformation.txt
ip route show table 7  >> $LOGDIR/reset/networkInformation.txt
ip route show table 8  >> $LOGDIR/reset/networkInformation.txt

#//系统中当前的网络socket 的详细信息
echo " "  >>$LOGDIR/reset/networkInformation.txt
echo "*****************************************************************"  >>$LOGDIR/reset/networkInformation.txt
echo "************ system network sockets information"  >>$LOGDIR/reset/networkInformation.txt
busybox netstat -a>> $LOGDIR/reset/networkInformation.txt

# ZTE_MODIFY end fanwuxun/dupucun

$BINDIR/busybox rm -r /sdcard/logtemp
mkdir /sdcard/logtemp
$BINDIR/busybox cp -r $LOGDIR /sdcard/logtemp
