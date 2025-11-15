#!/bin/bash

LOGFILE="/var/log/sysinfo"

{
echo "===== NEW ENTRY ====="
echo "DATE: $(date)"
echo "UPTIME / USERS / CPU LOAD:"
/usr/bin/w
echo "MEMORY USAGE:"
/usr/bin/free -m
echo "DISK USAGE:"
/usr/bin/df -h
echo "OPEN TCP PORTS:"
/usr/sbin/ss -tulpn
echo "PING to ukr.net:"
/usr/bin/ping -c1 -W1 ukr.net
echo "SUID PROGRAMS:"
/usr/bin/find / -perm -4000 -type f 2>/dev/null
echo "======================"
} >> $LOGFILE
